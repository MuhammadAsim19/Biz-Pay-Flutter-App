import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 380,
      height: 255.sp,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          AssetImageWidget(url: Assets.publishIconSuccess,width: 90.w,height: 86.h,),
          10.y,
          AppText("Account deleted", style: Styles.circularStdMedium(context,fontSize: 18,color: AppColors.primaryColor))
          ,10.y,

          AppText("You’ve successfully deleted your account\n  and will no longer be able to recover it.", style: Styles.circularStdRegular(context),maxLine: 2,)
        ],

      ),
    );
  }
}
