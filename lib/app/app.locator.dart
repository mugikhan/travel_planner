// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_themes/src/theme_service.dart';

import '../data/services/connectivity/connectivity_service.dart';
import '../data/services/http/http_service.dart';
import '../data/services/http/http_service_impl.dart';
import '../data/services/notification/notification_service.dart';
import '../data/services/notification/notification_service_impl.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<NotificationService>(
      () => NotificationServiceImpl());
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  final connectivityService = await ConnectivityService.getInstance();
  locator.registerSingleton(connectivityService);
}
