import 'package:bookworm/core/assets/assets.dart';
import 'package:bookworm/core/endpoints/endpoints.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/home/controller/home_controller.dart';
import 'package:bookworm/features/single_book/controller/single_book_controller.dart';
import 'package:bookworm/features/single_book/views/single_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchBookCard extends StatelessWidget {
  final String authorName;
  final String bookTitle;
  final int coverId;
  final int publishYear;
  final Books? book;
  const SearchBookCard({
    super.key,
    required this.authorName,
    required this.bookTitle,
    required this.coverId,
    required this.publishYear,
    this.book,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GestureDetector(
      onTap: () => Get.to(() => BookDetailsScreen(book: book!)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: context.width * 0.2,
              height: context.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: homeController.searchLoading.value
                        ? AssetImage(AppAssets.defaultPicture)
                        : NetworkImage('${Endpoints.coverUrl}/$coverId-M.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeController.searchLoading.value
                        ? BoneMock.name
                        : bookTitle,
                    style: TextStyle(
                        fontSize: 18,
                        color: Pallet.secondary,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Author - $authorName',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Published in - $publishYear',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
