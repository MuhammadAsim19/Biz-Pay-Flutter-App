import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/ConnectAccount/balance_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/Common/available_balance_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/Common/numeric_custom_textfield.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/Controller/withdraw_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/State/withdraw_state.dart';
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
      appBar: CustomAppBar(leading: true, title: AppStrings.withdraw),
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

            WidgetFunctions.instance
                .snackBar(context, text: AppStrings.withdrawStarted);
          }
        },
        builder: (BuildContext context, WithdrawState state) =>
            (balanceModel != null)
                ? ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AvailableBalanceWidget(balanceModel: balanceModel),
                      const Divider(thickness: 0.4),
                      20.y,
                      Center(
                        child: AppText(
                          AppStrings.withdrawAmount,
                          style: Styles.circularStdMedium(
                            context,
                            fontSize: 12,
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ),
                      NumericCustomTextfield(controller: controller),
                      // const Spacer(),
                      20.y,
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
                            text: AppStrings.withdraw),
                      )
                    ],
                  )
                : const SizedBox(),
      ),
    );
  }
}
