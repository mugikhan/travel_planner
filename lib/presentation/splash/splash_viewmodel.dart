import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> navigateToHomeView() async {
    await _navigationService.navigateTo(BottomNavRoutes.homeView);
  }

  Future<void> navigateToLoginView() async {
    await _navigationService.navigateTo(Routes.loginView);
  }
}
