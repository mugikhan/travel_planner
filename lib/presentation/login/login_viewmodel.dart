import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.logger.dart';
import 'package:travel_planner/data/exceptions/network_exception.dart';

import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger('FormViewModel');
  // final _loginUseCase = locator<LoginUserUseCase>();
  final _snackbarService = locator<SnackbarService>();

  @override
  void setFormStatus() {
    // log.i('Set form Status with data: $formValueMap');
  }

  Future login() async {
    setBusy(true);
    if ((!hasEmailValidationMessage) && (!hasPasswordValidationMessage)) {
      // LoginUser user = LoginUser(email: emailValue!, password: passwordValue!);
      try {
        // await _loginUseCase.execute(user: user);
        setBusy(false);
        if (!kIsWeb) {
          // await _appRouter.popAndPush(BottomNavRoute());
        } else {
          // await _appRouter.replace(const CompanySelectorRoute());
        }
      } catch (error) {
        setBusy(false);
        var exception = error as NetworkException;
        // _snackbarService.showErrorSnackbar(exception.message);
      }
    }
  }
}
