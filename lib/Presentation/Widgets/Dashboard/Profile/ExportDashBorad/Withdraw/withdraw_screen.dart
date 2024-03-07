import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/ConnectAccount/balance_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/widget_functions.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/Controller/withdraw_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/State/withdraw_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController controller = TextEditingController();
  BalanceModel? balanceModel;

  @override
  void initState() {
    context.read<WithdrawCubit>().getBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(leading: true, title: 'Withdraw'),
      body: BlocConsumer<WithdrawCubit, WithdrawState>(
        listener: (BuildContext context, WithdrawState state) {
          if (state is WithdrawLoadingState) {
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is WithdrawErrorState) {
            Navigator.pop(context);
            WidgetFunctions.instance
                .showErrorSnackBar(context: context, error: state.error);
          }

          if (state is WithdrawLoadedState) {
            balanceModel = state.balanceModel;
            Navigator.pop(context);
          }
          if (state is WithdrawWithdrawProcessingState) {
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is WithdrawWithdrawSuccessState) {
            Navigator.pop(context);
            Navigator.pop(context);

            WidgetFunctions.instance.snackBar(context,
                text:
                    'Withdraw process for the specified amount has been start, Amount will be deposited soon!');
          }
        },
        builder: (BuildContext context, WithdrawState state) =>
            (balanceModel != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              'Available Balance',
                              style: Styles.circularStdMedium(
                                context,
                                fontSize: 16,
                                color: AppColors.lightGreyColor,
                              ),
                            ),
                            AppText(
                              '\$${balanceModel?.balance}',
                              style: Styles.circularStdMedium(
                                context,
                                fontSize: 24,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 0.4),
                      20.y,
                      Center(
                        child: AppText(
                          'Withdraw Amount',
                          style: Styles.circularStdMedium(
                            context,
                            fontSize: 12,
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ),
                      TextField(
                        style: Styles.circularStdRegular(
                          context,
                          fontSize: 30,
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: '0.00',
                          hintStyle: Styles.circularStdRegular(
                            context,
                            fontSize: 30,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          RegExp regex = RegExp(
                              r'[^\d.]|(\.)(?=.*\.)|(?<=\.\d{2})\.|(?<=\.\d)\d+');
                          controller.text =
                              controller.text.trim().replaceAll(regex, '');
                          log(controller.text);
                        },
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: CustomButton(
                            onTap: () {
                              if (controller.text.isNotEmpty) {
                                context
                                    .read<WithdrawCubit>()
                                    .triggerWithdraw(amount: controller.text);
                              }
                            },
                            text: 'Withdraw'),
                      )
                    ],
                  )
                : const SizedBox(),
      ),
    );
  }
}
