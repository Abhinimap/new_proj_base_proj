/*
 *
 * Created by Vikrant Patil on 23/01/24, 12:00 pm
 * Copyright (c) 2024 . All rights reserved.
 * Last modified 23/01/24, 2:24 pm
 *
 *
 */

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:starter_template_get_x/data/data.dart';

import '../endpoints/endpoints.dart';

class AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: Add authentication header here

    // if (StorageUtil.getToken().isNotEmpty) {
    //   // NOTE: Setting authorization token here
    //   options.headers['Authorization'] = 'Bearer ${StorageUtil.getToken()}';
    // }
    // bool hasInternet = await InternetConnection().hasInternetAccess;
    // if (!hasInternet) {
    //   CustomSnackBar.pleaseCheckYourInternetConnection();
    //   DioAPIClient.cancelAllRequests();
    // }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Utils.isAPISuccessfulViaStatusCode(statusCode: response.statusCode!) &&
            response.data is Map
        ? response.data[Constants.apiCallStatus] = true
        : response.data[Constants.apiCallStatus] = false;

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      if (Utils.checkIfNotNull(err.response?.statusCode) &&
          err.response?.statusCode == Endpoints.unAuthorizedStatusCode) {
        // CustomSnackBar.error("You need to log out and login again.");
      }
      if (err.response?.data is Map) {
        err.response?.data[Constants.apiCallStatus] = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("On error exception");
        print(e);
      }
    }
    super.onError(err, handler);
  }
}
