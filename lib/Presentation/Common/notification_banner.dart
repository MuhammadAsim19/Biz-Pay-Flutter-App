import 'dart:async';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';

class BannerExample extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String payloadData;
  Timer timerDialog;

  BannerExample(
      {super.key,
      required this.imageUrl,
      required this.description,
      required this.payloadData,
      required this.timerDialog});

  @override
  Widget build(BuildContext context) {
    print("banner called");
    return SizedBox(
      width: 1.sw / 1,
      height: 126.h,
      child: Dismissible(
        background: Container(
          color: Colors.transparent,
        ),
        secondaryBackground: Container(
          color: Colors.transparent,
        ),
        key: UniqueKey(),
        direction: DismissDirection.vertical,
        onDismissed: (dire) {
          if (dire == DismissDirection.up) {
            timerDialog.cancel();
            Navigator.of(context).pop(true);
          }
        },
        child: Container(
          color: AppColors.whiteColor,
          child: Column(
            children: [
              CustomSizedBox.height(10),
              Row(
                children: [
                  CustomSizedBox.width(10),
                  CachedImage(
                    url: imageUrl,
                    isCircle: true,
                    radius: 40.sp,
                  ),
// ,              CircleAvatar(
//                 radius: 40.sp,
//                 backgroundImage: const Ne(Assets.appLogo),
//               ),

                  const SizedBox(width: 10),
                  Expanded(
                    child: AppText(
                      description,
                      maxLine: 8,
                      style:
                          Styles.circularStdRegular(context, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              //  const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSizedBox.width(10),
                  CustomButton(
                    bgColor: AppColors.whiteColor,
                    textColor: AppColors.greyColor,
                    borderColor: AppColors.borderColor,
                    horizontalPadding: 25,
                    onTap: () {
                      timerDialog.cancel();
                      Navigator.of(context).pop(true);
                    },
                    text: 'Ignore',
                  ),
                  const SizedBox(width: 20),
                  CustomButton(
                    horizontalPadding: 25,
                    onTap: () {
                      timerDialog.cancel();
                      Navigator.of(context).pop(true);
                      // NotificationServices().(context, payloadData);
                    },
                    text: 'View',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
