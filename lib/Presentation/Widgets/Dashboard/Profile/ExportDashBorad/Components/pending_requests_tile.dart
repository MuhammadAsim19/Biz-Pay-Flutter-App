import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText('Business Name ',
              style: Styles.circularStdMedium(context, fontSize: 16)),
          4.y,
          AppText('Order Number : #11391s302',
              style: Styles.circularStdRegular(context,
                  fontSize: 14, color: AppColors.greyTextColor)),
          4.y,
          Row(
            children: [
              AppText('Order for badge type : ',
                  style: Styles.circularStdMedium(context, fontSize: 14)),
              AppText('Limousine',
                  style: Styles.circularStdRegular(context,
                      fontSize: 14, color: AppColors.greyTextColor)),
            ],
          ),
          4.y,
          Row(
            children: [
              AppText('Order time : ',
                  style: Styles.circularStdMedium(context, fontSize: 14)),
              AppText('2 days Ago',
                  style: Styles.circularStdRegular(context,
                      fontSize: 14, color: AppColors.greyTextColor)),
              const Spacer(),
            ],
          ),
          10.y,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                height: 38,
                width: 80,
                onTap: () {},
                text: "Accept",
                textSize: 13,
              ),
              CustomButton(
                height: 38,
                width: 80,
                bgColor: AppColors.whiteColor,
                onTap: () {},
                text: "Cancel",
                textColor: AppColors.blackColor,
                textSize: 13,
              )
            ],
          ),
        ],
      ),
    );
  }
}