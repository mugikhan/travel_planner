import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions groupOptions = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      minimumFontSize: 12,
    ),
  );

  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.tryParse("https://inappwebview.dev/"),
          ),
          initialOptions: groupOptions,
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            // var uri = navigationAction.request.url!;

            // if (!["http", "https", "file", "chrome", "data", "javascript", "about"]
            //     .contains(uri.scheme)) {
            //   if (await canLaunchUrl(uri)) {
            //     // Launch the App
            //     await launchUrl(
            //       uri,
            //     );
            //     // and cancel the request
            //     return NavigationActionPolicy.CANCEL;
            //   }
            // }

            return NavigationActionPolicy.ALLOW;
          },
          onProgressChanged: (controller, progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
          onConsoleMessage: (controller, consoleMessage) {
            print(consoleMessage);
          },
        ),
        progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
      ],
    );
  }
}
