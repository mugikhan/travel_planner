import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/domain/entities/user/user.dart';
import 'package:travel_planner/domain/repositories/user_repository.dart';

abstract class LoginUserUseCase {
  Future<void> execute(User user);
}

class LoginUserUseCaseImpl implements LoginUserUseCase {
  final _userRepository = locator<UserRepository>();

  @override
  Future<void> execute(User user) async {
    try {
      await _userRepository.login(user);
    } catch (e) {
      rethrow;
    }
  }
}
