import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.logger.dart';
import 'package:travel_planner/data/exceptions/network_exception.dart';

import 'http_service.dart';

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl implements HttpService {
  final _log = getLogger('HttpServiceImpl');

  late Dio dio;

  HttpServiceImpl() {
    dio = Dio()
      ..options.baseUrl = dotenv.env["API_URL"] ?? "http://localhost:8888"
      ..options.connectTimeout = 60000
      ..options.sendTimeout = 60000
      ..options.receiveTimeout = 60000
      ..options.headers = {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true,
        "Access-Control-Allow-Headers": "X-Requested-With,content-type",
        "Access-Control-Allow-Methods":
            "GET, POST, OPTIONS, PUT, PATCH, DELETE",
        "Accept": "*/*"
      }
      ..options.contentType = Headers.jsonContentType;
  }

  @override
  Future<dynamic> getHttp(String path,
      {Map<String, dynamic>? queryParams}) async {
    Response response;

    _log.i('Sending GET to ${dio.options.baseUrl}$path');

    try {
      response = await dio.get(
        path,
        queryParameters: queryParams,
      );
    } on DioError catch (e) {
      _log.e('HttpService: Failed to GET $e');
      String message = handleError(e);
      throw NetworkException(message);
    }

    return response.data;
  }

  @override
  Future<dynamic> postHttp(String path, dynamic body,
      {Map<String, dynamic>? queryParams}) async {
    Response response;

    _log.i('Sending $body to ${dio.options.baseUrl}$path');

    try {
      response = await dio.post(
        path,
        data: json.encode(body),
        // onSendProgress: network_utils.showLoadingProgress,
        // onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      _log.e('HttpService: Failed to POST ${e.toString()}');
      String message = handleError(e);
      throw NetworkException(message);
    }

    return response.data;
  }

  @override
  Future<dynamic> postUrlEncodedHttp(
    String path,
    dynamic body, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    _log.i('Sending $body to $path');

    try {
      var newDio = Dio(
        BaseOptions(
          baseUrl: dotenv.env["API_URL"] ?? "http://localhost:8888",
          contentType: Headers.formUrlEncodedContentType,
          method: "POST",
          connectTimeout: 60000,
          sendTimeout: 60000,
          receiveTimeout: 60000,
          headers: headers,
        ),
      );
      response = await newDio.post(
        path,
        data: body,
      );
    } on DioError catch (e) {
      _log.e('HttpService: Failed to POST ${e.toString()}');
      String message = handleError(e);
      throw NetworkException(message);
    }

    return response.data;
  }

  @override
  Future<dynamic> deleteHttp(String path,
      {Map<String, dynamic>? queryParams}) async {
    Response response;

    _log.i('Sending DELETE to ${dio.options.baseUrl}$path');

    try {
      final fullRoute = Uri.encodeFull(path);
      response = await dio.delete(
        fullRoute,
      );
    } on DioError catch (e) {
      _log.e('HttpService: Failed to DELETE $e');
      String message = handleError(e);
      throw NetworkException(message);
    }

    return response.data;
  }
  // @override
  // Future<dynamic> putHTTP(String url, {FileBox fileBox}) async {
  //   Response response;

  //   try {
  //     response = await dio.put(
  //       url,
  //       data: fileBox.file.openRead(),
  //       options: Options(
  //         headers: {
  //           // "Content-Length": image.lengthSync(),
  //           "Content-MD5": fileBox.hash,
  //         },
  //       ),
  //       onSendProgress: (int sentBytes, int totalBytes) {
  //         double progressPercent = sentBytes / totalBytes * 100;
  //         print("$progressPercent %");
  //       },
  //     );
  //   } catch(e){
  //     _log.d('HttpService: Failed to PUT ${e}');
  //     String message = handleError(e);
  //     throw NetworkException(message);
  //   }

  //   return response.data;
  // }

  // @override
  // Future<File> downloadFile(String fileUrl) async {
  //   Response response;

  //   final file = await _fileHelper.getFileFromUrl(fileUrl);

  //   try {
  //     response = await dio.download(
  //       fileUrl,
  //       file.path,
  //       onReceiveProgress: network_utils.showLoadingProgress,
  //     );
  //   }catch (e) {
  //     _log.severe('HttpService: Failed to download file ${e}');
  //     String message = handleError(e);
  //     throw NetworkException(message);
  //   }

  //   return file;
  // }

  @override
  String handleError(DioError dioError) {
    String errorDescription = "";
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription =
            "Received invalid status code: ${dioError.response?.statusCode ?? 'N/A'}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
    }
    return errorDescription;
  }

  @override
  void dispose() {
    dio.close(force: true);
  }
}
