import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? leading;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      title: AppText('$title',
          style: Styles.circularStdMedium(context, fontSize: 18.sp)),
      centerTitle: true,
      leadingWidth: 48.w,
      leading: leading == null
          ? Padding(
              padding: EdgeInsets.only(left: 20.0.sp),
              child: const BackArrowWidget(),
            )
          : const SizedBox(),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
