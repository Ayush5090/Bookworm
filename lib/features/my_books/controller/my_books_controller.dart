import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/services/local_database.dart';
import 'package:bookworm/core/utils/utils.dart';
import 'package:get/get.dart';

class MyBooksController extends GetxController {
  RxList<Books> userWishlist = <Books>[].obs;
  RxList<Books> currentlyReadingList = <Books>[].obs;

  @override
  void onInit() {
    // getting wishlist from local database
    userWishlist = RxList.from(LocalDatabase.getWishlistBooks() ?? []);
    // getting current reading list from local database
    currentlyReadingList =
        RxList.from(LocalDatabase.getCurrentlyReadingBooks() ?? []);
    super.onInit();
  }

  void removeOrAddToWishlist(Books book) async {
    /// To compare two books objects already overrides the Equality Operator in Books Model.
    if (userWishlist.contains(book)) {
      // If already present that means user want to remove the book from the list
      await LocalDatabase.deleteFromWishlist(book.coverId ?? 1);
      userWishlist.remove(book);
      update(['wishlist']);
      Utils.showToast('Book successfully removed from your wishlist.');
    } else {
      if (currentlyReadingList.contains(book)) {
        // Checking if book present in current reading list and removing if present
        await LocalDatabase.deleteFromCurrentlyReadingBox(book.coverId ?? 1);
        currentlyReadingList.remove(book);
        update(['currently-reading']);
      }
      await LocalDatabase.addToWishlistBox(book);
      userWishlist.insert(0, book);
      update(['wishlist']);
      Utils.showToast('Book successfully added to your wishlist.');
    }
  }

  void markUnmarkCurrentlyReading(Books book) async {
    // If already present that means user want to remove the book from the list
    if (currentlyReadingList.contains(book)) {
      await LocalDatabase.deleteFromCurrentlyReadingBox(book.coverId ?? 1);
      currentlyReadingList.remove(book);
      update(['currently-reading']);
      Utils.showToast(
          'Book successfully removed from your current reading list.');
    } else {
      if (userWishlist.contains(book)) {
        // Checking if book present in wishlist and removing if present
        await LocalDatabase.deleteFromWishlist(book.coverId ?? 1);
        userWishlist.remove(book);
        update(['wishlist']);
      }
      await LocalDatabase.addToCurrentlyReadingBox(book);
      currentlyReadingList.insert(0, book);
      update(['currently-reading']);
      Utils.showToast('Book successfully added to your current reading list.');
    }
  }

  /// Adds book to current reading list if user started reading the book.
  void addToCurrentReadingList(Books book) async {
    if (!currentlyReadingList.contains(book)) {
      // If book not present in current reading list.
      if (userWishlist.contains(book)) {
        // Checking if book present in wishlist and removing if present
        await LocalDatabase.deleteFromWishlist(book.coverId ?? 1);
        userWishlist.remove(book);
        update(['wishlist']);
      }
      await LocalDatabase.addToCurrentlyReadingBox(book);
      currentlyReadingList.insert(0, book);
      update(['currently-reading']);
    }
  }
}
