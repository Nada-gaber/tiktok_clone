// import 'dart:convert';
// import 'package:dio/dio.dart';

// class CustomLoggerInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final buffer = StringBuffer()
//       ..writeln(' REQUEST →')
//       ..writeln(' URL: ${options.uri}')
//       ..writeln(' METHOD: ${options.method}')
//       ..writeln(' HEADERS: ${jsonEncode(options.headers)}');

//     if (options.data != null) {
//       buffer.writeln(' BODY: ${_prettyJson(options.data)}');
//     }

//     print(buffer.toString());
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     final buffer = StringBuffer()
//       ..writeln(' RESPONSE ←')
//       ..writeln(' URL: ${response.requestOptions.uri}')
//       ..writeln(' STATUS CODE: ${response.statusCode}')
//       ..writeln(' RESPONSE DATA: ${_prettyJson(response.data)}');

//     print(buffer.toString());
//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     final buffer = StringBuffer()
//       ..writeln(' ERROR !!!')
//       ..writeln(' URL: ${err.requestOptions.uri}')
//       ..writeln(' STATUS CODE: ${err.response?.statusCode}')
//       ..writeln(' MESSAGE: ${err.message}')
//       ..writeln(' TYPE: ${err.type}')
//       ..writeln(' RESPONSE: ${_prettyJson(err.response?.data)}');

//     print(buffer.toString());

//     // Firebase Crashlytics sending error
//     // FirebaseCrashlytics.instance.recordError(
//     //   err.error,
//     //   err.stackTrace,
//     //   reason: 'Dio Error',
//     // );

//     super.onError(err, handler);
//   }

//   String _prettyJson(dynamic data) {
//     try {
//       const encoder = JsonEncoder.withIndent('  ');
//       if (data is String) {
//         final decoded = json.decode(data);
//         return encoder.convert(decoded);
//       } else if (data is Map || data is List) {
//         return encoder.convert(data);
//       } else {
//         return data.toString();
//       }
//     } catch (e) {
//       return data.toString();
//     }
//   }
// }
