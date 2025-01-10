import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';

import 'package:vir/core/key/storage_keys.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/storage/app_storage.dart';
import 'package:vir/core/utils/function_component.dart';

class DefaultInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Set request timeouts
    options.connectTimeout = const Duration(milliseconds: 20000);
    options.sendTimeout = const Duration(milliseconds: 20000);
    options.receiveTimeout = const Duration(milliseconds: 20000);

    // Add Authorization header if token is available
    String? authToken = StorageManager.readData(StoreKeys.token);
    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
      options.headers['Accept'] = 'application/json';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response); // Pass the response to the next handler
  }

  @override
  void onError(DioException? err, ErrorInterceptorHandler handler) {
    // Log the error for debugging purposes
    if (kDebugMode) {
      print('Error occurred: ${err?.response?.data}');
    }

    // Handle Unauthorized error
    if (err?.response?.statusCode == 401) {
      Get.offAllNamed(RoutesNames.login);
      StorageManager.deleteAllData();
      FunctionalWidget.showSnackBar(
          title: "Unauthorized, please login again", success: false);
    } else if (err?.type == DioExceptionType.sendTimeout ||
        err?.type == DioExceptionType.receiveTimeout) {
      // Handle timeout errors
      FunctionalWidget.showSnackBar(
          title: "Request timed out, please try again", success: false);
    }

    handler.next(err!); // Pass the error to the next handler
  }
}

