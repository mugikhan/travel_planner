import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:travel_planner/data/data_sources/user/user_remote_data_source.dart';
import 'package:travel_planner/data/repositories/user_repository_impl.dart';
import 'package:travel_planner/data/services/localstore/encryptedcache/encrypted_cache.dart';
import 'package:travel_planner/data/services/localstore/hive_service.dart';
import 'package:travel_planner/domain/repositories/user_repository.dart';
import 'package:travel_planner/domain/usecases/login_user_usecase.dart';
import 'package:travel_planner/presentation/common/bottom_nav/bottom_nav_view.dart';
import 'package:travel_planner/presentation/home/home_view.dart';
import 'package:travel_planner/presentation/signin/sign_in_view.dart';
import 'package:travel_planner/presentation/splash/splash_view.dart';
import 'package:travel_planner/presentation/webview/webview.dart';

import '../data/services/connectivity/connectivity_service.dart';
import '../data/services/http/http_service.dart';
import '../data/services/http/http_service_impl.dart';
import '../data/services/notification/notification_service.dart';
import '../data/services/notification/notification_service_impl.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(
      page: SplashView,
      initial: true,
    ),
    AdaptiveRoute(
      page: SignInView,
    ),
    AdaptiveRoute(
      page: Webview,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: BottomNav,
      children: [
        AdaptiveRoute(
          page: HomeView,
          initial: true,
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
    LazySingleton(
        classType: UserRemoteDataSourceImpl, asType: UserRemoteDataSource),
    //Repositories
    LazySingleton(classType: UserRepositoryImpl, asType: UserRepository),
    //Use Cases
    LazySingleton(classType: LoginUserUseCaseImpl, asType: LoginUserUseCase),
    //ViewModels
    //Design
    //Presolve instances
    Presolve(
      classType: ConnectivityService,
      presolveUsing: ConnectivityService.getInstance,
    ),
    Presolve(
      classType: HiveService,
      presolveUsing: HiveService.getInstance,
    ),
    Presolve(
      classType: EncryptedCache,
      presolveUsing: EncryptedCache.getInstance,
    ),
  ],
  logger: StackedLogger(),
  locatorName: 'locator',
  locatorSetupName: 'setupLocator',
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
