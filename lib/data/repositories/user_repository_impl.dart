import 'dart:convert';

import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.logger.dart';
import 'package:travel_planner/data/data_sources/user/user_remote_data_source.dart';
import 'package:travel_planner/data/services/http/http_service.dart';
import 'package:travel_planner/domain/entities/token/token.dart';
import 'package:travel_planner/domain/entities/user/user.dart';
import 'package:travel_planner/domain/repositories/user_repository.dart';

import '../exceptions/network_exception.dart';

class UserRepositoryImpl implements UserRepository {
  final _httpService = locator<HttpService>();
  // final _encryptedCache = locator<EncryptedCache>();
  final _userRemoteDataSource = locator<UserRemoteDataSource>();
  final log = getLogger('User Repo');

  @override
  Future login(User user) async {
    try {
      var clientID = "54726176656c20506c616e6e6572";
      var clientSecret =
          "EF5CDFB9C974B3AA384CCCD2C4201435BFE79CBB9F801FD6570F648124845DAB";
      var clientCredentials =
          const Base64Encoder().convert("$clientID:$clientSecret".codeUnits);
      dynamic response =
          await _userRemoteDataSource.loginUser(user, clientCredentials);
      Token token = Token.fromJson(response);

      // await _encryptedCache.cacheToken(token.token);
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> isTokenExpired() {
    // TODO: implement isTokenExpired
    throw UnimplementedError();
  }
}
