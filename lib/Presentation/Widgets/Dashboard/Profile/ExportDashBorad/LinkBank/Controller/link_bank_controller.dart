// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Repository/ConnectAccount/connect_account_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class LinkBankController {
  ValueNotifier<bool> isLoading = ValueNotifier(true);
  String? onboardingLink;
  getOnboardingUrl({required BuildContext context}) async {
    ConnectAccountRepo.getOnboardingUrl().then((value) {
      log(value.toString());
      if (value["Success"]) {
        onboardingLink = value["body"];

        isLoading.value = false;
        isLoading.notifyListeners();
      } else {
        Navigate.pop(context);
        WidgetFunctions.instance.showErrorSnackBar(
            context: context,
            error:
                value?["error"]?["msg"] ?? "Error Happened, Try again later");
      }
    });
  }

  verifyOnboardingStatus({required BuildContext context}) async {
    isLoading.value = true;
    isLoading.notifyListeners();
    Navigate.pop(context);

    // ConnectAccountRepo.verifyOboarding().then((value) async {
    //   log(value.toString());
    //   if (value["Success"]) {
    //     Navigate.pop(context);
    //     WidgetFunctions.instance.snackBar(context, text: value["body"]);
    //   } else {
    //     Navigate.pop(context);

    //     WidgetFunctions.instance.showErrorSnackBar(
    //         context: context,
    //         error: value["error"] ?? "Error Happened, Try again later");
    //   }
    //   isLoading.value = false;
    //   isLoading.notifyListeners();
    // });
  }
}
