import 'package:bookworm/core/endpoints/endpoints.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/services/api_service.dart';

class HomeRepo {
  Future<BooksModel?> getBooks(String title) async {
    Map<String, dynamic>? res = await ApiService().get<Map<String, dynamic>>(
        path: '${Endpoints.searchUrl}?q=$title&limit=10');

    if (res != null) {
      return BooksModel.fromJson(res);
    } else {
      return null;
    }
  }

  Future<BooksModel?> searchBooks(String title, int offset) async {
    Map<String, dynamic>? res = await ApiService().get<Map<String, dynamic>>(
        path: '${Endpoints.searchUrl}?title=$title&limit=10&offset=$offset');

    if (res != null) {
      return BooksModel.fromJson(res);
    } else {
      return null;
    }
  }
}
