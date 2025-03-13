import 'package:bookworm/core/endpoints/endpoints.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/utils/utils.dart';
import 'package:bookworm/features/home/repository/home_repo.dart';
import 'package:bookworm/features/home/views/home_screen.dart';
import 'package:bookworm/features/home/views/search_screen.dart';
import 'package:bookworm/features/my_books/controller/my_books_controller.dart';
import 'package:bookworm/features/my_books/views/my_books_screen.dart';
import 'package:bookworm/features/profile/views/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Books> loveBooks = [];
  List<Books> adventureBooks = [];
  List<Books> actionBooks = [];
  List<Books> biographyBooks = [];
  List<Books> fantasyBooks = [];
  List<Books> searchedBooks = [];
  int searchOffset = 0;
  RxInt navBarIndex = 0.obs;
  RxBool homeLoading = false.obs;
  RxBool searchLoading = false.obs;
  RxBool onScrollLoading = false.obs;

  late TextEditingController searchController;
  late ScrollController searchScrollController;
  late MyBooksController myBooksController;

  @override
  void onInit() {
    getBooks();
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    myBooksController = Get.put(MyBooksController());
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Scroll Listener for pagination
  /// function will call search api again with updated offset
  /// when user reaches max scroll extent
  void addScrollListener() {
    searchScrollController.addListener(
      () {
        if (searchScrollController.position.pixels ==
                searchScrollController.position.maxScrollExtent &&
            !onScrollLoading.value) {
          // checking onScrollLoading if api already called
          searchBooks(fromScroll: true);
        }
      },
    );
  }

  /// Navigation screens for bottom nav bar
  List<Widget> getNavScreen() {
    return const [
      HomeScreen(),
      MyBooksScreen(),
      ProfileScreen(),
    ];
  }

  /// Navigation destinations for bottom nav bar
  List<Widget> getNavigationDestination() {
    return [
      NavigationDestination(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home',
        selectedIcon: Icon(
          Icons.home_rounded,
        ),
      ),
      NavigationDestination(
        icon: Icon(
          CupertinoIcons.book,
        ),
        label: 'My Books',
        selectedIcon: Icon(
          Icons.menu_book_sharp,
        ),
      ),
      NavigationDestination(
        icon: Icon(
          Icons.person_outline_rounded,
        ),
        label: 'Profile',
        selectedIcon: Icon(
          Icons.person,
        ),
      ),
    ];
  }

  /// Get books for home screen
  void getBooks() async {
    homeLoading.value = true;
    List<Future<BooksModel?>> apiCalls = [];

    // Calling apis with different genres of books
    apiCalls.addAll([
      HomeRepo().getBooks('love'),
      HomeRepo().getBooks('biography'),
      HomeRepo().getBooks('action'),
      HomeRepo().getBooks('fantasy'),
      HomeRepo().getBooks('adventure'),
    ]);

    // Calling all apis concurrently to lower the loading time
    List<BooksModel?> data = await Future.wait(apiCalls);

    loveBooks = data[0]?.books ?? [];
    biographyBooks = data[1]?.books ?? [];
    actionBooks = data[2]?.books ?? [];
    fantasyBooks = data[3]?.books ?? [];
    adventureBooks = data[4]?.books ?? [];

    homeLoading.value = false;
  }

  void searchBooks({bool fromScroll = false}) async {
    if (searchController.text.isNotEmpty || fromScroll) {
      if (fromScroll) {
        // if from scroll listener
        onScrollLoading.value = true;
      } else {
        searchLoading.value = true;
        Get.to(() => SearchScreen());
      }

      BooksModel? data =
          await HomeRepo().searchBooks(searchController.text, searchOffset);

      if (data != null) {
        searchedBooks.addAll(data.books ?? []);
        searchOffset = searchedBooks.length;
      } else {
        Utils.showToast('Something went wrong');
      }

      if (fromScroll) {
        onScrollLoading.value = false;
      } else {
        searchLoading.value = false;
      }
    } else {
      Utils.showToast('Please enter book title to search');
    }
  }
}
