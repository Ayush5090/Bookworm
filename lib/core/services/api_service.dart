import 'dart:async';
import 'package:bookworm/core/endpoints/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'api_handler.dart';

/// Singleton class for API calls
class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  late Dio dio;

  ApiService._internal() {
    BaseOptions baseOptions = BaseOptions(baseUrl: Endpoints.baseUrl);
    dio = Dio(baseOptions); // Initializing Dio with base url

    /// Handling errors in Interceptor
    dio.interceptors
        .add(InterceptorsWrapper(onError: (DioException exception, handler) {
      String err = ApiHandler()
          .getExceptionMessage(exception); // getting exception message
      ApiHandler().errorSnackBar(err); // displaying error message to user
      handler.next(exception);
    }));
  }

  /// Reusable function for Get API.
  /// Define return type during calling
  /// ```dart
  /// String? response = await ApiService().get<String>(path: 'Your Endpoint');
  /// ```
  Future<T?> get<T>(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Options? options,
      String? token}) async {
    try {
      Response res = await dio.get(path,
          queryParameters: queryParameters,
          options: options ??
              Options(
                headers: {
                  'Authorization': 'Bearer $token'
                }, // Pass token if need to
              ));

      if (res.statusCode == 200) {
        return res.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Reusable function for Post API.
  /// Define return type during calling
  /// ```dart
  /// String? response = await ApiService().post<String>(path: 'Your Endpoint', data: {});
  /// ```
  Future<T?> post<T>(
      {required String path,
      required dynamic data,
      Options? options,
      String? token}) async {
    try {
      Response res = await dio.post(path,
          data: data,
          options:
              options ?? Options(headers: {'Authorization': 'Bearer $token'}));
      if (res.statusCode == 200) {
        return res.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
