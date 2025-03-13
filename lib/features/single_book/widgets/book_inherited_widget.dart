import 'package:bookworm/core/models/books_model.dart';
import 'package:flutter/material.dart';

class BookInheritedWidget extends InheritedWidget {
  final Books book;

  const BookInheritedWidget({
    super.key,
    required this.book,
    required super.child,
  });

  static BookInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BookInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant BookInheritedWidget oldWidget) {
    return book != oldWidget.book;
  }
}
