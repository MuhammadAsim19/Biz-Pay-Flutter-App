import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/ConnectAccount/balance_model.dart';

class AvailableBalanceWidget extends StatelessWidget {
  const AvailableBalanceWidget({
    super.key,
    required this.balanceModel,
  });

  final BalanceModel? balanceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
