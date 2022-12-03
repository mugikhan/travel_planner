import 'package:travel_planner/domain/entities/user/user.dart';

abstract class UserRepository {
  Future login(User user);
  Future<bool> isTokenExpired();
}
