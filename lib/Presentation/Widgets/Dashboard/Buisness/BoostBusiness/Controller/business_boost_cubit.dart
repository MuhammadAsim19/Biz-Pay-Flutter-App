import 'dart:developer';

import 'package:buysellbiz/Application/Services/PaymentServices/payment_services.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Business/business_boost_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/boost_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BoostBusiness/State/business_boost_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class BusinessBoostCubit extends Cubit<BusinessBoostState> {
  BusinessBoostCubit() : super(BusinessBoostInitialState());

  void getPackages() async {
    await Future.delayed(Duration.zero);
    emit(BusinessBoostLoadingState());
    BusinessBoostRepo.getBoostPackages().then(
      (value) {
        if (value['Success']) {
          emit(BusinessBoostLoadedState(
              boostPackages: (value['body'] as List)
                  .map((e) => BoostModel.fromJson(e))
                  .toList()));
        } else {
          emit(BusinessBoostErrorState(error: value['error']));
        }
      },
    );
  }

  void activateBoost({
    required String planId,
    required String businessId,
    required BuildContext context,
  }) async {
    try {
      emit(BusinessBoostLoadingState());
      BusinessBoostRepo.activeBoostPackage(
              planId: planId, businessId: businessId)
          .then(
        (value) async {
          if (value['Success']) {
            //
            final pi = await PaymentServices.performStripeTransfer(
                    context: context,
                    clientSecret: value['body']['client_secret'])
                .catchError((error) {
              emit(BusinessBoostErrorState(error: error.toString()));
              return error;
            });
            final verificationResult = await PaymentServices.verifyBoostPayment(
                pi: pi.id, businessId: businessId);
            if (verificationResult['Success']) {
              emit(BusinessBoostActivatedState());
            } else {
              emit(BusinessBoostErrorState(error: verificationResult['error']));
            }
            emit(BusinessBoostActivatedState());
          } else {
            emit(BusinessBoostErrorState(error: value['error']));

            //
          }
        },
      );
    } on StripeException catch (e) {
      emit(BusinessBoostErrorState(error: e.toString()));
    } catch (e) {
      emit(BusinessBoostErrorState(error: e.toString()));
    }
  }
}
