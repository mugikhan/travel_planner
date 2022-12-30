import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_planner/app/app.locator.dart';
import 'package:travel_planner/presentation/common/scaffold/scaffold.dart';

class Webview extends StatefulWidget {
  const Webview({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final _navigationService = locator<NavigationService>();

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
                print("CODE $code");
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
