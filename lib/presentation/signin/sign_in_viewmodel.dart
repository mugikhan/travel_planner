import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.router.dart';

class SignInViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> onSignPressed() async {
    await _navigationService.navigateToWebview(
      url:
          "http://localhost:8888/auth/code?client_id=54726176656c20506c616e6e6572&response_type=code&state=87uijn3rkja",
    );
  }
}
