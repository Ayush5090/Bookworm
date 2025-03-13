import 'package:bookworm/core/constants/constants.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/common/widgets/app_button.dart';
import 'package:bookworm/features/single_book/controller/single_book_controller.dart';
import 'package:bookworm/features/single_book/views/reading_view.dart';
import 'package:bookworm/features/single_book/widgets/book_info_container.dart';
import 'package:bookworm/features/single_book/widgets/book_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsScreen extends StatefulWidget {
  final Books book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late SingleBookController bookController;

  @override
  void initState() {
    bookController = Get.put(SingleBookController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        AppButton(
          text: 'Read Book',
          onTap: () => bookController.readBook(widget.book),
          buttonIcon: Icon(
            Icons.menu_book_rounded,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
      body: BookInheritedWidget(
          book: widget.book,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookInfoContainer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.book.title.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Pallet.secondary),
                      ),
                      Text(
                        'Synopsis',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        Constants.dummyText,
                      ),
                      Text(
                        'Chapters -',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Column(
                        children: List.generate(
                          bookController.bookChapters.length,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                bookController.bookChapters[index]['chapter'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                bookController.bookChapters[index]['desc'],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
