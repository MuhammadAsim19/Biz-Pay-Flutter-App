import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30.h,
        width: 25.w,
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(Assets.arrowBackIcon)));
  }
}
