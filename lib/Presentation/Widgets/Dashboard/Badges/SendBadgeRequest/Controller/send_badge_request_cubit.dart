import 'dart:developer';

import 'package:buysellbiz/Application/Services/PaymentServices/payment_services.dart';
import 'package:buysellbiz/Data/DataSource/Repository/BadgesRepo/badges_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/SendBadgeRequest/Controller/send_badge_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendBadgeRequestCubit extends Cubit<SendBadgeRequestState> {
  SendBadgeRequestCubit() : super(SendBadgeRequestInitial());

  sendBadgesRequest(
      {BuildContext? context,
      Map<String, dynamic>? data,
      String? pathName}) async {
    Future.delayed(const Duration(microseconds: 10));
    emit(SendBadgeRequestLoading());

    log("request data ${data.toString()}");

    await BadgesRepo.sendBadgeRequest(data: data, path: pathName)
        .then((value) async {
      log("here is the data ${value.toString()}");

      if (value['Success']) {
        final pi = await PaymentServices.performStripeTransfer(
          clientSecret: value['body']['client_secret'],
          context: context,
        ).catchError((e) {
          emit(SendBadgeRequestError(error: e.toString()));
          throw e;
        });

        var data = {
          "intentId": pi.id,
          "badgeReqestId": value['body']['badgeId']
        };

        log(data.toString());

        final verficationResults =
            await PaymentServices.verifyBadgePayment(data: data);

        log("verification ${verficationResults.toString()}");

        if (verficationResults["Success"]) {
          emit(SendBadgeRequestLoaded());
        } else {
          log(value.toString());
          emit(SendBadgeRequestError(
              error: verficationResults['error'].toString()));
        }
      } else {
        emit(SendBadgeRequestError(error: value['error']));
      }
    }).catchError((e) {
      emit(SendBadgeRequestError(error: e.toString()));
      throw e;
    });
  }
}
