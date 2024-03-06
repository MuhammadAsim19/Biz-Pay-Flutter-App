import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class TabButton extends StatelessWidget {
  const TabButton({super.key, this.title, this.onTap, this.active});

  final String? title;
  final bool? active;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color:
                  active == true ? AppColors.primaryColor : Colors.transparent),
          boxShadow: const [
            BoxShadow(
              color: AppColors.borderColor,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: AppText(title!,
            style: Styles.circularStdRegular(context, fontSize: 16.sp)),
      ),
    );
  }
}
