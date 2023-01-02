import 'dart:convert';

import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.logger.dart';
import 'package:travel_planner/data/data_sources/user/user_remote_data_source.dart';
import 'package:travel_planner/data/exceptions/network_exception.dart';
import 'package:travel_planner/data/services/localstore/encryptedcache/encrypted_cache.dart';
import 'package:travel_planner/domain/entities/token/token.dart';
import 'package:travel_planner/domain/entities/user/user.dart';
import 'package:travel_planner/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final _encryptedCache = locator<EncryptedCache>();
  final _userRemoteDataSource = locator<UserRemoteDataSource>();
  final log = getLogger('User Repo');

  @override
  Future login(User user) async {
    try {
      Map<String, dynamic> response =
          await _userRemoteDataSource.loginUser(user);
      Token token = Token.fromJson(response);

      await _encryptedCache.cacheToken(token);
    } on NetworkException catch (e) {
      if (e.message == "invalid_grant") {
        throw const NetworkException("Invalid username/password");
      }
      rethrow;
    }
  }

  @override
  Future<bool> isTokenExpired() async {
    // Token? token = await _encryptedCache.getToken();;
    // if (token != null) {
    //   final date = DateTime(token.expiresIn);
    //   if (date.isAfter(DateTime.now())) return false;
    // }
    // return true;
    throw UnimplementedError();
  }
}
