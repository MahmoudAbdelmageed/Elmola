import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../local_storage/local_storage.dart';

class ApiService {
  static const baseUrl = 'BaseUrl';

  static Dio dioClient() {
    String token = LocalStorage.getString(LocalStorage.apiToken) ?? '';
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.cacheControlHeader: 'no-Cache',
        if (LocalStorage.isLoggedIn) 'Authorization': 'Bearer $token'
      },
      validateStatus: (status) {
        return status! <= 500;
      },
      connectTimeout: 60000,
      receiveTimeout: 60000,
    );

    Dio _dio = Dio(options)
      // ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(responseBody: true)
      );
    return _dio;
  }

  // DioCacheManager _getCacheManager() {
  //   if (null == _manager) {
  //     _manager = DioCacheManager(CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
  //   }
  //   return _manager;
  // }

  static Future<Response<dynamic>> post(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
  }) {
    final response = dioClient().post(
      path,
      data: formData ?? FormData.fromMap(body!),
      onSendProgress: (x, y) {
        if (kDebugMode) {
          print(x);
        }
      },
    );
    return response;
  }

  static Future<Response<dynamic>> get(String path) {
    final response = dioClient().get(path);
    return response;
  }
}
