import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview_screen extends StatefulWidget {
  const Webview_screen({super.key});

  @override
  State<Webview_screen> createState() => _Webview_screenState();
}

class _Webview_screenState extends State<Webview_screen> {
  // WebViewController controller = WebViewController()

  //   ..loadRequest(Uri.parse("https://my-exam-bd.com/"));

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          CircularProgressIndicator();
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://my-exam-bd.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
