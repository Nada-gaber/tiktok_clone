import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = 'https://api.pexels.com/v1/';

    // interceptors without use package 
    //  _dio.interceptors.add(CustomLoggerInterceptor());

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final apiKey = dotenv.env['PEXELS_API_KEY'];
          options.headers['Authorization'] = apiKey;
          return handler.next(options);
        },
      ),
    );

    // Add Logging Interceptor (only in debug mode)
    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }
  Dio get client => _dio;
}
