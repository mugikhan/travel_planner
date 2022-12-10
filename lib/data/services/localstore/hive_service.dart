import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_planner/data/constants/local_store_keys.dart';
import 'package:travel_planner/domain/entities/token/token.dart';
import 'package:travel_planner/domain/entities/user/user.dart';

class HiveService {
  static Future<HiveService> getInstance() async {
    await _init();
    return Future.value(HiveService());
  }

  static _init() async {
    //Register Adapters
    Hive.registerAdapter<User>(UserAdapter());
    Hive.registerAdapter<Token>(TokenAdapter());
    //Open all boxes?
    await Hive.openBox<User>(LocalStoreKeys.userBox);
    await Hive.openBox<Token>(LocalStoreKeys.encryptedBox);
  }
}
