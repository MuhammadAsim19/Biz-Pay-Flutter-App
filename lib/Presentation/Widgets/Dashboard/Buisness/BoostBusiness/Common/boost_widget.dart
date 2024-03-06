import 'package:buysellbiz/Domain/BusinessModel/boost_model.dart';

import '../../../../../../Data/DataSource/Resources/imports.dart';

class BoostTile extends StatelessWidget {
  const BoostTile({
    super.key,
    required this.isSelected,
    required this.model,
    required this.onTap,
  });
  final bool isSelected;
  final BoostModel model;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.lightInvoiceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: isSelected ? 1.4 : 0.3,
          color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor,
        ),
      ),
      child: MaterialButton(
        onPressed: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    model.duration ?? '',
                    style: Styles.circularStdMedium(
                      context,
                      fontSize: 20,
                      color: AppColors.lightGreyColor,
                    ),
                  ),
                  AppText(
                    'Billed Onetime',
                    style: Styles.circularStdRegular(
                      context,
                      fontSize: 14,
                      color: AppColors.lightGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            AppText(
              "\$${model.price}",
              style: Styles.circularStdMedium(
                context,
                fontSize: 24,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
