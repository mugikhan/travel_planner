// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;
import 'package:travel_planner/presentation/common/bottom_nav/bottom_nav_view.dart'
    as _i3;
import 'package:travel_planner/presentation/home/home_view.dart' as _i5;
import 'package:travel_planner/presentation/login/login_view.dart' as _i2;

class Routes {
  static const loginView = '/';

  static const bottomNav = '/bottom-nav';

  static const all = <String>{
    loginView,
    bottomNav,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.bottomNav,
      page: _i3.BottomNav,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i2.LoginView(key: args.key),
        settings: data,
      );
    },
    _i3.BottomNav: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.BottomNav(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i4.Key? key;
}

class BottomNavRoutes {
  static const homeView = '/home-view';

  static const all = <String>{homeView};
}

class BottomNavRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      BottomNavRoutes.homeView,
      page: _i5.HomeView,
    )
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i5.HomeView: (data) {
      final args = data.getArgs<NestedHomeViewArguments>(
        orElse: () => const NestedHomeViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i5.HomeView(key: args.key, id: args.id),
        settings: data,
      );
    }
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class NestedHomeViewArguments {
  const NestedHomeViewArguments({
    this.key,
    this.id,
  });

  final _i4.Key? key;

  final String? id;
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToLoginView({
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNav([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNav,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedHomeViewInBottomNav({
    _i4.Key? key,
    String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(BottomNavRoutes.homeView,
        arguments: NestedHomeViewArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
