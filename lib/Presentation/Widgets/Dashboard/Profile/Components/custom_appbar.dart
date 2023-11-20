import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? leading;

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

      
      title: AppText('$title', style: Styles.circularStdMedium(context, fontSize: 18.sp)
      
      ),
      centerTitle: true,
      leading: Padding(
        padding:  EdgeInsets.all(15.sp),
        child: GestureDetector(
          onTap: (){
Navigator.pop(context); 
          },
          child: SvgPicture.asset(leading??Assets.arrowleft)),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
