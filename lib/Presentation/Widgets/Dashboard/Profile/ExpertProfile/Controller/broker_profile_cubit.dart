import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buysellbiz/Application/Services/ApiServices/api_services.dart';
import 'package:buysellbiz/Application/Services/PaymentServices/payment_services.dart';
import 'package:buysellbiz/Data/DataSource/Repository/Brokers/brokers.dart';
import 'package:buysellbiz/Data/DataSource/Repository/PackagesRepo/packages_repo.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Packages/package_model.dart';
import 'package:meta/meta.dart';

part 'broker_profile_state.dart';

class BrokerProfileCubit extends Cubit<BrokerProfileState> {
  BrokerProfileCubit() : super(BrokerProfileInitial());

  createBroker(
      {required Map<String, dynamic> body,
      String? imagePath,
      required BuildContext context}) async {
    emit(BrokerProfileLoading());

    try {
      await BrokersData.switchToBroker(body: body, imagePath: imagePath).then(
        (value) async {
          log("Response: $value");
          if (value['Success']) {
            // stripe sheet>>
            final pi = await PaymentServices.performStripeTransfer(
              clientSecret: value['body'],
              context: context,
            );
            final verficationResults =
                await PaymentServices.verifySubscreptionPayment(pi.id);
            if (verficationResults["Success"]) {
              emit(BrokerProfileLoaded());
            } else {
              emit(BrokerProfileError(error: value['error']));
            }
          } else {
            emit(BrokerProfileError(error: value['error']));
          }
        },
      ).catchError((e) {
        emit(BrokerProfileError(error: e.toString()));
        throw e;
      });
    } catch (e) {
      log(e.toString());
      emit(BrokerProfileError(error: e.toString()));
      rethrow;
    }
  }

  void getPackages() async {
    await PackageRepo.getPackages().then((value) async {
      log(value.toString());
      if (value['Success']) {
        emit(BrokerPackagesLoadedState(
            packages: (value['body'] as List)
                .map((e) => PackageModel.fromJson(e))
                .toList()));
      } else {
        emit(BrokerPackagesErrorState(error: value['error']));
      }
    }).catchError((e) {
      emit(BrokerPackagesErrorState(error: e.toString()));
      throw e;
    });
  }
}
