import 'package:bookworm/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final int page;
  const PageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Page $page',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text(
              'The Start Title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              Constants.dummyText,
            ),
            Text(
              Constants.dummyText,
            ),
            Text(
              Constants.dummyText,
            ),
          ],
        ),
      ),
    );
  }
}
