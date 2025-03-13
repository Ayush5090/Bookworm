import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/core/services/local_database.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:bookworm/features/home/widgets/book_card.dart';
import 'package:bookworm/features/single_book/views/single_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BooksList extends StatelessWidget {
  final List<Books> books;
  final String? emptyListMessage;
  const BooksList({super.key, required this.books, this.emptyListMessage});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: context.height * 0.33,
      child: homeController.homeLoading.value
          ? ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => BookCard(
                  title: BoneMock.title, author: BoneMock.name, coverId: 1),
            )
          : books.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) => BookCard(
                    onTap: () => Get.to(
                        () => BookDetailsScreen(book: books[index]),
                        transition: Transition.rightToLeftWithFade),
                    title: books[index].title!,
                    author: books[index].authorName![0],
                    coverId: books[index].coverId!,
                    book: books[index],
                  ),
                )
              : Center(
                  child: Text(
                    emptyListMessage ?? '0 Books',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Pallet.secondary),
                  ),
                ),
    );
  }
}
