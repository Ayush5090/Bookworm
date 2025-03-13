import 'package:bookworm/features/single_book/controller/single_book_controller.dart';
import 'package:bookworm/features/single_book/widgets/page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_flip/page_flip.dart';

class ReadingView extends StatefulWidget {
  const ReadingView({super.key});

  @override
  State<ReadingView> createState() => _ReadingViewState();
}

class _ReadingViewState extends State<ReadingView> {
  late SingleBookController bookController;
  @override
  void initState() {
    bookController = Get.find();
    bookController.pageKey = GlobalKey<PageFlipWidgetState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GetBuilder<SingleBookController>(builder: (_) {
        return PageFlipWidget(
            key: bookController.pageKey,
            children: List.generate(
              5,
              (index) => PageWidget(
                page: ++index,
              ),
            ));
      })),
    );
  }
}
