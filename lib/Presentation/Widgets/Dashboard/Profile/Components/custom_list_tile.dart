import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';


 class CustomListTile extends StatelessWidget {

  final String? leadingicon;
  final String? title;
  final String? trailing;

  const CustomListTile({
    super.key,
    this.leadingicon,
    this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(leadingicon!),
      title: AppText(title!,
          style: Styles.circularStdMedium(context, fontSize: 16.sp)),
      trailing: SvgPicture.asset(trailing!),
    );
  }
}
 


 