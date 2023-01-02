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
import 'package:travel_planner/presentation/signin/sign_in_view.dart' as _i3;
import 'package:travel_planner/presentation/splash/splash_view.dart' as _i2;
import 'package:travel_planner/presentation/webview/webview.dart' as _i4;

class Routes {
  static const splashView = '/';

  static const signInView = '/sign-in-view';

  static const webView = '/web-view';

  static const bottomNav = '/bottom-nav';

  static const all = <String>{
    splashView,
    signInView,
    webView,
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
      Routes.signInView,
      page: _i3.SignInView,
    ),
    _i1.RouteDef(
      Routes.webView,
      page: _i4.WebView,
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
    _i3.SignInView: (data) {
      final args = data.getArgs<SignInViewArguments>(
        orElse: () => const SignInViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i3.SignInView(key: args.key),
        settings: data,
      );
    },
    _i4.WebView: (data) {
      final args = data.getArgs<WebViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i4.WebView(
            key: args.key, url: args.url, authState: args.authState),
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

class SignInViewArguments {
  const SignInViewArguments({this.key});

  final _i6.Key? key;
}

class WebViewArguments {
  const WebViewArguments({
    this.key,
    required this.url,
    this.authState,
  });

  final _i6.Key? key;

  final String url;

  final String? authState;
}

class BottomNavRoutes {
  static const homeView = '/';

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

  Future<dynamic> navigateToSignInView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signInView,
        arguments: SignInViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebView({
    _i6.Key? key,
    required String url,
    String? authState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webView,
        arguments: WebViewArguments(key: key, url: url, authState: authState),
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
