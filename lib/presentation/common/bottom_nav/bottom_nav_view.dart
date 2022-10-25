import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.router.dart';

import 'bottom_nav_viewmodel.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavExampleViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: ExtendedNavigator(
          navigatorKey: StackedService.nestedNavigationKey(1),
          initialRoute: BottomNavRoutes.homeView,
          router: BottomNavRouter(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 6,
          backgroundColor: Colors.white,
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.handleNavigation,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.favorite),
            //   label: 'Favorites',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.history),
            //   label: 'History',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
          ],
        ),
      ),
      viewModelBuilder: () => BottomNavExampleViewModel(),
    );
  }
}
