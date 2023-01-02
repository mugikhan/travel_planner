import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/data/services/localstore/encryptedcache/encrypted_cache.dart';
import 'package:travel_planner/domain/entities/token/token.dart';
import 'package:travel_planner/presentation/common/scaffold/scaffold.dart';

class WebView extends StatefulWidget {
  const WebView({
    super.key,
    required this.url,
    required this.authState,
  });

  final String url;
  final String authState;

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
            _navigationService.back();
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
                if (state == widget.authState) {
                  print("STATE MATCH");
                }
                try {
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
                  String clientId = const Base64Encoder().convert(
                      "54726176656c20506c616e6e6572:TravelPlannerTopSecret"
                          .codeUnits);
                  final response = await newDio.post(
                    "/auth/token",
                    options: Options(
                      headers: {"Authorization": "Basic $clientId"},
                    ),
                    data: {
                      'grant_type': 'authorization_code',
                      'code': code,
                    },
                  );

                  // Get the access token from the response
                  Token token = Token.fromJson(response.data);
                  await _encryptedCache.cacheToken(token);
                  _navigationService.back();
                } catch (err) {
                  print(err);
                }
              } else if (uri.queryParameters.containsKey("error")) {
                String error = uri.queryParameters["error"]!;
                _navigationService.back();
              } else if (uri.queryParameters.containsKey("success")) {
                _navigationService.back();
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
