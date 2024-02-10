import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DeleteWebView extends StatefulWidget {
  const DeleteWebView({super.key});

  @override
  State<DeleteWebView> createState() => _DeleteWebViewState();
}

class _DeleteWebViewState extends State<DeleteWebView> {
  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'http://bizzpayapp.com/login',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
