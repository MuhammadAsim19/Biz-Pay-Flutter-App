import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class AddSuccessDialog extends StatelessWidget {
  const AddSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 380.w,
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
          AppText("Business upload successfully", style: Styles.circularStdMedium(context,fontSize: 18,color: AppColors.primaryColor))
,10.y,

          AppText("You’ve successfully upload your business \n                           details.", style: Styles.circularStdRegular(context),maxLine: 2,)
        ],

      ),
    );
  }
}
