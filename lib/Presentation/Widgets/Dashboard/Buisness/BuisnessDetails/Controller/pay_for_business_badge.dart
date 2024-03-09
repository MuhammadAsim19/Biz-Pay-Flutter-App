import 'dart:developer';

import 'package:buysellbiz/Application/Services/PaymentServices/payment_services.dart';
import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/pay_for_business_badge_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayForBusinessBadge extends Cubit<PayForBusinessBadgeState> {
  PayForBusinessBadge() : super(PayForBusinessBadgeStateInitial());

  requestBagdeView(
      {required String badgeId, required BuildContext context}) async {
    await Future.delayed(const Duration(microseconds: 10));
    emit(PayForBusinessBadgeStateLoading());
    await BadgesRepo.requestBadgeView(badgeId: badgeId).then(
      (value) async {
        log(value.toString());
        if (value["Success"]) {
          final pi = await PaymentServices.performStripeTransfer(
            clientSecret: value['body']['client_secret'],
            context: context,
          );

          final verficationResults =
              await PaymentServices.verifyBadgeViewPayment(data: {
            "intentId": pi.id,
            "badgeId": badgeId,
          });
          if (verficationResults["Success"]) {
            emit(PayForBusinessBadgeStateLoaded());
          } else {
            log(value.toString());
            emit(PayForBusinessBadgeStateError(
                error: verficationResults['error'].toString()));
          }
        } else {
          emit(PayForBusinessBadgeStateError(error: value["error"]));
        }
      },
    ).catchError((e) {
      emit(PayForBusinessBadgeStateError(error: e.toString()));
    });
  }
}
