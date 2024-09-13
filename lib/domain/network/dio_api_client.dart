import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../domain.dart';
import 'package:starter_template_get_x/data/data.dart';

class DioAPIClient {
  DioAPIClient._();

  static CancelToken _cancelToken = CancelToken();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      contentType: 'application/json',
    ),
  )
    ..interceptors.add(AuthenticationInterceptor())
    ..interceptors.add(
      PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          maxWidth: 90),
    );

  static cancelAllRequests() {
    _cancelToken.cancel();
    _cancelToken = CancelToken();
  }

  static Future<CustomResponse> get(
      {Object? data,
      Options? options,
      required String endpoint,
      Map<String, dynamic>? queryParameters,
      void Function(int count, int total)? onReceiveProgress}) async {
    try {
      Response response = await _dio.get(endpoint,
          onReceiveProgress: onReceiveProgress,
          data: data,
          options: options,
          cancelToken: _cancelToken,
          queryParameters: queryParameters);

      if (response.statusCode != null &&
          Utils.isAPISuccessfulViaStatusCode(
              statusCode: response.statusCode!)) {
        return CustomResponse.fromJson(response.data);
      }
      return CustomResponse.fromJson({
        'message': 'Something went wrong',
        'apiCallStatus': ApiCallStatus.error,
        'status': 400,
        'count': {
          "total": 0,
        },
        'data': [],
      });
    } on DioException catch (e) {
      if (e.response?.data != null &&
          e.response?.data is Map &&
          e.response?.data.containsKey('message')) {
        return CustomResponse.fromJson(e.response?.data);
      }
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    } catch (e) {
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    }
  }

  static Future<CustomResponse> post({
    required String endpoint,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    void Function(int count, int total)? onSendProgress,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.post(
        endpoint,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode != null &&
          Utils.isAPISuccessfulViaStatusCode(
              statusCode: response.statusCode!)) {
        return CustomResponse.fromJson(response.data);
      }
      return CustomResponse.fromJson({
        'message': 'Something went wrong',
        'apiCallStatus': ApiCallStatus.error,
        'status': 400,
        'count': {
          "total": 0,
        },
        'data': [],
      });
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Debug");
        print(e.response?.data);
      }
      if (e.response?.data != null &&
          e.response?.data is Map &&
          e.response?.data.containsKey('message')) {
        return CustomResponse.fromJson(e.response?.data);
      }
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    }
  }

  static Future<CustomResponse> put({
    required String endpoint,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    void Function(int count, int total)? onSendProgress,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.put(endpoint,
          data: data,
          cancelToken: cancelToken,
          options: options,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);

      if (Utils.checkIfNotNull(response.statusCode) &&
          Utils.isAPISuccessfulViaStatusCode(
              statusCode: response.statusCode!)) {
        return CustomResponse.fromJson(response.data);
      }
      return CustomResponse.fromJson({
        'message': 'Something went wrong',
        'apiCallStatus': ApiCallStatus.error,
        'status': 400,
        'count': {
          "total": 0,
        },
        'data': [],
      });
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
      if (e.response?.data != null &&
          e.response?.data is Map &&
          e.response?.data.containsKey('message')) {
        return CustomResponse.fromJson(e.response?.data);
      }
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    } catch (e) {
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    }
  }

  static Future<CustomResponse> delete({
    required String endpoint,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.delete(
        endpoint,
        data: data,
        cancelToken: cancelToken,
        options: options,
      );

      if (Utils.checkIfNotNull(response.statusCode) &&
          Utils.isAPISuccessfulViaStatusCode(
              statusCode: response.statusCode!)) {
        return CustomResponse.fromJson(response.data);
      }
      return CustomResponse.fromJson({
        'message': 'Something went wrong',
        'apiCallStatus': ApiCallStatus.error,
        'status': 400,
        'count': {
          "total": 0,
        },
        'data': [],
      });
    } on DioException catch (e) {
      if (e.response?.data != null &&
          e.response?.data is Map &&
          e.response?.data.containsKey('message')) {
        return CustomResponse.fromJson(e.response?.data);
      }
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    } catch (e) {
      return CustomResponse.fromJson(
        {
          'message': 'Something went wrong',
          'apiCallStatus': ApiCallStatus.error,
          'status': 400,
          'data': [],
        },
      );
    }
  }
}
