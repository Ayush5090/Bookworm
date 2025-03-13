import 'package:bookworm/core/assets/assets.dart';
import 'package:bookworm/core/endpoints/endpoints.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:bookworm/features/home/widgets/book_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final int coverId;
  final VoidCallback? onTap;
  final Books? book;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.coverId,
    this.onTap,
    this.book,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.4,
        padding: const EdgeInsets.symmetric(vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.width * 0.4,
              height: context.height * 0.24,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: homeController.homeLoading.value
                        ? AssetImage(AppAssets.defaultPicture)
                        : NetworkImage('${Endpoints.coverUrl}/$coverId-M.jpg'),
                    fit: BoxFit.cover,
                  )),
              child: book != null
                  ? BookStatusWidget(
                      book: book!,
                    )
                  : const SizedBox.shrink(),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        author,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                // PopupMenuButton(
                //   itemBuilder: (context) =>
                //       [PopupMenuItem(child: Text('hehe'))],
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
