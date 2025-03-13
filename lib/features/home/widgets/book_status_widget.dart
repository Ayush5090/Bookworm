import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/features/my_books/controller/my_books_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookStatusWidget extends StatelessWidget {
  final Books book;
  const BookStatusWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    MyBooksController myBooksController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: PopupMenuButton(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          position: PopupMenuPosition.under,
          menuPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
                onTap: () => myBooksController.removeOrAddToWishlist(book),
                child: Text(
                  myBooksController.userWishlist.contains(book)
                      ? 'Remove from wishlist'
                      : 'Add to Wishlist',
                )),
            PopupMenuItem(
                onTap: () => myBooksController.markUnmarkCurrentlyReading(book),
                child: Text(
                  myBooksController.currentlyReadingList.contains(book)
                      ? 'Remove from Currently Reading'
                      : 'Mark Currently Reading',
                )),
          ],
          child: Icon(
            Icons.bookmark_add_outlined,
          ),
        ),
      ),
    );
  }
}
