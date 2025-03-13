import 'package:bookworm/core/constants/constants.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/features/my_books/controller/my_books_controller.dart';
import 'package:bookworm/features/single_book/views/reading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:page_flip/page_flip.dart';

class SingleBookController extends GetxController {
  final List<Map<String, dynamic>> bookChapters = [
    {'chapter': 'Chapter 1', 'desc': Constants.chapterDescription},
    {'chapter': 'Chapter 2', 'desc': Constants.chapterDescription},
    {'chapter': 'Chapter 3', 'desc': Constants.chapterDescription},
    {'chapter': 'Chapter 4', 'desc': Constants.chapterDescription},
    {'chapter': 'Chapter 5', 'desc': Constants.chapterDescription},
  ];

  late GlobalKey<PageFlipWidgetState> pageKey;

  void readBook(Books book) async {
    MyBooksController myBooksController = Get.find();
    // Adding book to user's current reading list
    myBooksController.addToCurrentReadingList(book);
    Get.to(() => ReadingView(), transition: Transition.rightToLeftWithFade);
  }
}
