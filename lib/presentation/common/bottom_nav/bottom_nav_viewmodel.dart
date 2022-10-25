import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.logger.dart';
import 'package:travel_planner/app/app.router.dart';
import 'package:travel_planner/presentation/home/home_view.dart';

class BottomNavExampleViewModel extends IndexTrackingViewModel {
  final log = getLogger('BottomNavExampleViewModel');
  final _navigationService = locator<NavigationService>();

  void handleNavigation(int index) {
    log.i('handleNavigation: $index');
    setIndex(index);
    switch (index) {
      case 0:
        _navigationService.replaceWith(
          BottomNavRoutes.homeView,
          id: 1,
        );
        break;
      // case 1:
      //   _navigationService.clearStackAndShowView(
      //     const HistoryView(),
      //     id: 1,
      //   );
      //   break;
      // case 2:
      //   _navigationService.pushNamedAndRemoveUntil(
      //     BottomNavExampleRoutes.profileView,
      //     predicate: (route) => route.isFirst,
      //     id: 1,
      //   );
      //   break;
      default:
    }
  }
}
