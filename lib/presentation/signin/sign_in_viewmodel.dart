import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/app/app.router.dart';
import 'package:travel_planner/data/enums/snackbar_type.dart';
import 'package:travel_planner/data/enums/webview_response.dart';
import 'package:travel_planner/data/exceptions/network_exception.dart';
import 'package:travel_planner/domain/entities/user/user.dart';
import 'package:travel_planner/domain/usecases/login_user_usecase.dart';

import 'sign_in_view.form.dart';

class SignInViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginUserUseCase = locator<LoginUserUseCase>();
  final _snackbarService = locator<SnackbarService>();

  Future<void> onSignInPressed() async {
    WebViewResponse result = await _navigationService.navigateToWebView(
      url:
          "http://localhost:8888/auth/code?client_id=54726176656c20506c616e6e6572&response_type=code&state=87uijn3rkja",
      authState: "87uijn3rkja",
    );

    print("RESULT: $result");
  }

  Future<void> onRegisterPressed() async {
    WebViewResponse result = await _navigationService.navigateToWebView(
      url: "http://localhost:8888/register",
    );

    print("RESULT: $result");
  }

  Future<void> onSignPressed() async {
    String state = "87uijn3rkja";
    final clientId = '54726176656c20506c616e6e6572';
    final callbackUrlScheme = 'com.example.travel-planner://redirect';
    //'redirect_uri': '$callbackUrlScheme://redirect',

    // Construct the url
    final url = Uri.http('localhost:8888', '/auth/code', {
      'response_type': 'code',
      'client_id': clientId,
      'state': state,
    });

    // Present the dialog to the user
    final result = await FlutterWebAuth2.authenticate(
        url: url.toString(), callbackUrlScheme: "https");

    // Extract code from resulting url
    final code = Uri.parse(result).queryParameters['code'];
    print("CODE $code");

    // Use this code to get an access token
    var newDio = Dio(
      BaseOptions(
        baseUrl: "http://localhost:8888",
        contentType: Headers.formUrlEncodedContentType,
        method: "POST",
        connectTimeout: 60000,
        sendTimeout: 60000,
        receiveTimeout: 60000,
      ),
    );
    final response = await newDio.post(
      "/auth/token",
      data: {
        'client_id': clientId,
        'grant_type': 'authorization_code',
        'code': code,
      },
    );

    // Get the access token from the response
    final accessToken = jsonDecode(response.data)['access_token'] as String;
    print("TOKEN $accessToken");
    // await _navigationService.navigateToWebview(
    //   url:
    //       "http://localhost:8888/auth/code?client_id=54726176656c20506c616e6e6572&response_type=code&state=$state",
    //   authState: state,
    // );
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
