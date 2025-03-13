import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/home/widgets/books_list.dart';
import 'package:bookworm/features/my_books/controller/my_books_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBooksScreen extends StatelessWidget {
  const MyBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyBooksController myBooksController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Currently Reading',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Pallet.secondary),
                ),
                Icon(
                  Icons.menu_book,
                  color: Pallet.secondary,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<MyBooksController>(
              id: 'currently-reading',
              builder: (_) => BooksList(
                books: myBooksController.currentlyReadingList,
                emptyListMessage: 'Nothing to your current reading list',
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Wishlist',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Pallet.secondary),
                ),
                Icon(
                  Icons.bookmark_added,
                  color: Pallet.secondary,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<MyBooksController>(
              id: 'wishlist',
              builder: (_) => BooksList(
                books: myBooksController.userWishlist,
                emptyListMessage: '0 Books in your wishlist',
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
