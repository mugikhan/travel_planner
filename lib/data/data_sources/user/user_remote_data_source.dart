import 'dart:convert';

import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/data/constants/auth.dart';
import 'package:travel_planner/data/services/api/api_endpoints.dart';
import 'package:travel_planner/data/services/http/http_service.dart';
import 'package:travel_planner/domain/entities/user/user.dart';

abstract class UserRemoteDataSource {
  Future<Map<String, dynamic>> loginUser(User user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final _httpService = locator<HttpService>();

  @override
  Future<Map<String, dynamic>> loginUser(User user) async {
    try {
      String clientID = AuthConstants.clientId;
      String clientCredentials =
          const Base64Encoder().convert("$clientID:".codeUnits);
      final response = await _httpService.postUrlEncodedHttp(
        ApiEndpoints.login,
        user.toJson(),
        headers: {"Authorization": "Basic $clientCredentials"},
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
