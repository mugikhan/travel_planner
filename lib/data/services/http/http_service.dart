import 'package:dio/dio.dart';

abstract class HttpService {
  /// Send GET request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  Future<dynamic> getHttp(String url, {Map<String, dynamic>? queryParams});

  /// Send POST request with [body] to [url] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<dynamic> postHttp(String url, dynamic body,
      {Map<String, dynamic>? queryParams});

  /// Send DELETE request to endpoint/[processEndpoint] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if DELETE request fails
  Future<dynamic> deleteHttp(String url, {Map<String, dynamic>? queryParams});

  /// Send POST request with [files] to endpoint/[processEndpoint] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if posting form fails
  // Future<dynamic> postHttpForm(
  //   String path,
  //   dynamic body, {
  //   List<FileItem>? files,
  // });

  // Future<dynamic> putHTTP(String url, {FileBox fileBox});

  /// Download file from [fileUrl] and return the File
  ///
  /// - throws `NetworkException` if file download fails
  // Future<File> downloadFile(String fileUrl);

  String handleError(DioError dioError);

  void dispose();
}
