import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Components/business_details_add.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/UpdateBusiness/update_business.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key, required this.onClick});

  final Function(String? action) onClick;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      //padding: EdgeInsets.zero,

      position: PopupMenuPosition.under,
      color: Colors.white,
      elevation: 0,
      offset: Offset(-15.sp, 10.sp),
      constraints: BoxConstraints(
          minWidth: 140.sp,
          maxWidth: 140.sp,
          minHeight: 170.sp,
          maxHeight: 180.sp),
      enabled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: const BorderSide(color: AppColors.borderColor)),
      onSelected: (value) async {
        onClick(value.name);

        // if (value == MenuItem1.edit) {
        //
        // }
      },
      child: SizedBox(
        height: 30.sp,
        width: 30.sp,
        child: SvgPicture.asset(
          Assets.threeDots,
        ),
      ),

      itemBuilder: (context) => [
        PopupMenuItem(
          value: MenuItem1.edit,
          padding: EdgeInsets.only(left: 10.sp, top: 5.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(flex: 1, child: SvgPicture.asset(Assets.editbusiness)),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Edit',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),

        //delete
        PopupMenuItem(
          value: MenuItem1.share,
          padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(Assets.sendbusiness),
              ),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Share',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),

        PopupMenuItem(
          value: MenuItem1.delete,
          padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(Assets.delete),
              ),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Delete',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: MenuItem1.boost,
          padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.trending_up,
                  size: 19.sp,
                  color: AppColors.blackColor,
                ),
              ),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Boost',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: MenuItem1.badge,
          padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(Assets.appBadges),
              ),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Add Badge',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum MenuItem1 {
  edit,
  delete,
  share,
  boost,
  badge,
}
