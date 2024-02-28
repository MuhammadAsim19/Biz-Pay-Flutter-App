import 'dart:developer';

import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Data/AppData/app_secrets.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentServices {
  static Future performStripeTransfer({
    required context,
    required int payment,
  }) async {
    return await ApiService.post('${ApiConstant.baseurl}/initatePayment', {
      'amount': '${payment * 100}',
    }).then((value) async {
      if (value.containsKey('clientSecret')) {
        try {
          Stripe.publishableKey = stripeKey;
          await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              merchantDisplayName: 'BUYSELLBIZ',
              paymentIntentClientSecret: value['clientSecret'],
            ),
          );

          await Stripe.instance.presentPaymentSheet();
          return true;
        } on StripeException catch (e) {
          rethrow;
        }
      }
    });
  }
}
