import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class CommonDialog extends StatelessWidget {
  final double? height;
  final double? width;
  final  String? titleText;
  final TextStyle? titleStyle;
  final String? descriptionText;
  final TextStyle? descStyle;

  const CommonDialog({super.key, this.height, this.width, this.titleText, this.titleStyle, this.descriptionText, this.descStyle});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:width?? 380,
      height:height?? 255.sp,
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

          AssetImageWidget(url: Assets.publishIconSuccess,width: 90.w,height: 86,),
          10.y,
          AppText( titleText??"", style: titleStyle??Styles.circularStdMedium(context,fontSize: 18,color: AppColors.primaryColor))
          ,10.y,

          AppText(descriptionText??"", style: descStyle??Styles.circularStdRegular(context),maxLine: 2,)
        ],

      ),
    );
  }
}