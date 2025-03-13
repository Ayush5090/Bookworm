import 'package:bookworm/core/endpoints/endpoints.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/features/single_book/widgets/book_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookInfoContainer extends StatelessWidget {
  const BookInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final Books? book = BookInheritedWidget.of(context)?.book;
    return Container(
      width: double.maxFinite,
      height: context.height * 0.42,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: NetworkImage('${Endpoints.coverUrl}/${book?.coverId}-M.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              '${Endpoints.coverUrl}/${book?.coverId}-M.jpg',
              fit: BoxFit.cover,
              width: context.width * 0.36,
              height: context.height * 0.24,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text.rich(TextSpan(
              text: 'Author: ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
              children: [TextSpan(text: book?.authorName![0].toString())])),
          const SizedBox(
            height: 5,
          ),
          Text.rich(TextSpan(
              text: 'Published in: ',
              style: TextStyle(
                  color: Colors.white, overflow: TextOverflow.ellipsis),
              children: [TextSpan(text: book?.firstPublishYear.toString())])),
        ],
      ),
    );
  }
}
