// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;
import 'package:travel_planner/presentation/common/bottom_nav/bottom_nav_view.dart'
    as _i5;
import 'package:travel_planner/presentation/home/home_view.dart' as _i7;
import 'package:travel_planner/presentation/login/login_view.dart' as _i3;
import 'package:travel_planner/presentation/splash/splash_view.dart' as _i2;
import 'package:travel_planner/presentation/webview/webview.dart' as _i4;

class Routes {
  static const splashView = '/';

  static const loginView = '/login-view';

  static const webview = '/Webview';

  static const bottomNav = '/bottom-nav';

  static const all = <String>{
    splashView,
    loginView,
    webview,
    bottomNav,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.webview,
      page: _i4.Webview,
    ),
    _i1.RouteDef(
      Routes.bottomNav,
      page: _i5.BottomNav,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i3.LoginView(key: args.key),
        settings: data,
      );
    },
    _i4.Webview: (data) {
      final args = data.getArgs<WebviewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i4.Webview(key: args.key, url: args.url),
        settings: data,
        fullscreenDialog: true,
      );
    },
    _i5.BottomNav: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i5.BottomNav(),
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

  final _i6.Key? key;
}

class WebviewArguments {
  const WebviewArguments({
    this.key,
    required this.url,
  });

  final _i6.Key? key;

  final String url;
}

class BottomNavRoutes {
  static const homeView = '/home-view';

  static const all = <String>{homeView};
}

class BottomNavRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      BottomNavRoutes.homeView,
      page: _i7.HomeView,
    )
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i7.HomeView: (data) {
      final args = data.getArgs<NestedHomeViewArguments>(
        orElse: () => const NestedHomeViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i7.HomeView(key: args.key, id: args.id),
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

  final _i6.Key? key;

  final String? id;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i6.Key? key,
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

  Future<dynamic> navigateToWebview({
    _i6.Key? key,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webview,
        arguments: WebviewArguments(key: key, url: url),
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
    _i6.Key? key,
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
