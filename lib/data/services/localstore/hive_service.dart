import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<HiveService> getInstance() async {
    await _init();
    return Future.value(HiveService());
  }

  static _init() async {
    //Register Adapters
    //Open all boxes?
  }
}
