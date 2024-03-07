import 'dart:developer';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/LinkBank/Controller/link_bank_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkBankScreen extends StatefulWidget {
  const LinkBankScreen({Key? key}) : super(key: key);

  @override
  State<LinkBankScreen> createState() => _LinkBankScreenState();
}

class _LinkBankScreenState extends State<LinkBankScreen> {
  late WebViewController _controller;
  final linkBankController = LinkBankController();
  // bool

  @override
  void initState() {
    linkBankController.getOnboardingUrl(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(leading: true, title: ''),
      body: ValueListenableBuilder(
        valueListenable: linkBankController.isLoading,
        builder: (context, value, child) => value
            ? const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              )
            : WebView(
                // initialUrl: ApiConstant.expertOnboarding,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  _controller = controller;
                  _controller.clearCache();
                  _controller.loadUrl(
                    linkBankController.onboardingLink ?? '',
                  );
                  _controller.currentUrl().then((url) {
                    log('Loaded: $url');
                  });
                },
                navigationDelegate: (NavigationRequest request) {
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  log('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  log('Page finished loading: $url');
                  if (url.contains("https://www.yourdomain.com/")) {
                    linkBankController.verifyOnboardingStatus(context: context);
                    // Navigate.pop(context);
                  }
                },
                onProgress: (int progress) {
                  log('WebView is $progress% loaded');
                },
                onWebResourceError: (error) {
                  log('Web resource error: $error');
                  Navigate.pop(context);
                },
              ),
      ),
    );
  }
}
