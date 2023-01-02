import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/data/enums/webview_response.dart';
import 'package:travel_planner/data/services/localstore/encryptedcache/encrypted_cache.dart';
import 'package:travel_planner/domain/entities/token/token.dart';
import 'package:travel_planner/presentation/common/scaffold/scaffold.dart';

class WebView extends StatefulWidget {
  const WebView({
    super.key,
    required this.url,
    this.authState,
  });

  final String url;
  final String? authState;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final _navigationService = locator<NavigationService>();
  final _encryptedCache = locator<EncryptedCache>();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions groupOptions = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
  );

  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return TravelScaffold(
      title: "",
      trailing: [
        IconButton(
          onPressed: () {
            _navigationService.back(result: WebViewResponse.cancelled);
          },
          icon: const Icon(Icons.clear),
        ),
      ],
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.tryParse(widget.url),
            ),
            initialOptions: groupOptions,
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url!;

              if (uri.queryParameters.containsKey("code")) {
                String code = uri.queryParameters["code"]!;
                String state = uri.queryParameters["state"]!;
                if (widget.authState != null && state == widget.authState!) {
                  print("STATE MATCH");
                }
                try {
                  String clientId = const Base64Encoder().convert(
                      "54726176656c20506c616e6e6572:TravelPlannerTopSecret"
                          .codeUnits);
                  final response = await Dio().post(
                    "http://localhost:8888/auth/token",
                    options: Options(
                      headers: {"Authorization": "Basic $clientId"},
                      contentType: Headers.formUrlEncodedContentType,
                    ),
                    data: {
                      'grant_type': 'authorization_code',
                      'code': code,
                    },
                  );

                  // Get the access token from the response
                  Token token = Token.fromJson(response.data);
                  await _encryptedCache.cacheToken(token);
                  _navigationService.back(result: WebViewResponse.loginSuccess);
                } catch (err) {
                  print(err);
                  _navigationService.back(result: WebViewResponse.loginFailed);
                }
              } else if (uri.queryParameters.containsKey("register")) {
                if (uri.queryParameters["register"]! == "success") {
                  _navigationService.back(
                      result: WebViewResponse.registerSuccess);
                } else {
                  _navigationService.back(
                      result: WebViewResponse.registerFailed);
                }
              }
              return NavigationActionPolicy.ALLOW;
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            onConsoleMessage: (controller, consoleMessage) {
              print(consoleMessage.message);
            },
          ),
          progress < 1.0
              ? LinearProgressIndicator(value: progress)
              : Container(),
        ],
      ),
    );
  }
}
