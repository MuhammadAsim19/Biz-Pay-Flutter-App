import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/app_secrets.dart';
import 'package:buysellbiz/Data/AppData/data.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentServices {
  static Future<PaymentIntent> performStripeTransfer({
    required context,
    required clientSecret,
  }) async {
    try {
      Stripe.publishableKey = stripeKey;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'BUYSELLBIZ',
          paymentIntentClientSecret: clientSecret,
        ),
      );
      await Stripe.instance.presentPaymentSheet();

      final pi = await Stripe.instance.retrievePaymentIntent(clientSecret);

      return pi;
    } on StripeException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static verifyPayment(String pi) async {
    var headers = {"authorization": " ${Data.app.token}"};

    return await ApiService.post(ApiConstant.verifyPayment, {'intentId': pi},
            header: headers)
        .then((value) {
      log("verifyPayment>> $value");
      return value;
    }).onError((error, stackTrace) =>
            {"Success": false, "error": error.toString()});
  }
  // static Future performStripeTransfer({
  //   required context,
  //   required int payment,
  // }) async {
  //   return await ApiService.post('${ApiConstant.baseurl}/initatePayment', {
  //     'amount': '${payment * 100}',
  //   }).then((value) async {
  //     if (value.containsKey('clientSecret')) {
  //       try {
  //         Stripe.publishableKey = stripeKey;
  //         await Stripe.instance.initPaymentSheet(
  //           paymentSheetParameters: SetupPaymentSheetParameters(
  //             merchantDisplayName: 'BUYSELLBIZ',
  //             paymentIntentClientSecret: value['clientSecret'],
  //           ),
  //         );
  //         await Stripe.instance.presentPaymentSheet();

  //         final pi = await Stripe.instance
  //             .retrievePaymentIntent(value['clientSecret']);

  //         return pi;
  //       } on StripeException catch (e) {
  //         log(e.toString());
  //         rethrow;
  //       }
  //     }
  //   });
  // }
}
