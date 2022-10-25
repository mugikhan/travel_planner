import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:travel_planner/presentation/common/bottom_nav/bottom_nav_view.dart';
import 'package:travel_planner/presentation/home/home_view.dart';
import 'package:travel_planner/presentation/login/login_view.dart';

import '../data/services/connectivity/connectivity_service.dart';
import '../data/services/http/http_service.dart';
import '../data/services/http/http_service_impl.dart';
import '../data/services/notification/notification_service.dart';
import '../data/services/notification/notification_service_impl.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(
      page: LoginView,
      initial: true,
    ),
    AdaptiveRoute(
      page: BottomNav,
      children: [
        AdaptiveRoute(
          page: HomeView,
          // children: [
          //   MaterialRoute(page: MultipleFuturesExampleView),
          //   CustomRoute(page: HistoryView),
          // ],
        ),
        // CustomRoute(
        //   page: HistoryView,
        //   transitionsBuilder: TransitionsBuilders.fadeIn,
        // ),
        // CupertinoRoute(page: ProfileView),
      ],
    ),
  ],
  dependencies: [
    //Stacked Services
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    //Services
    LazySingleton(
        classType: NotificationServiceImpl, asType: NotificationService),
    LazySingleton(classType: HttpServiceImpl, asType: HttpService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    //Data Sources
    //ViewModels
    //Design
    //Presolve instances
    Presolve(
      classType: ConnectivityService,
      presolveUsing: ConnectivityService.getInstance,
    ),
  ],
  logger: StackedLogger(),
  locatorName: 'locator',
  locatorSetupName: 'setupLocator',
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
