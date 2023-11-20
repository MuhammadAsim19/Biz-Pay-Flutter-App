import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

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
          minHeight: 110.sp,
          maxHeight: 110.sp),
      enabled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: const BorderSide(color: AppColors.borderColor)),
      onSelected: (value) async {
        print(value);
        // if (value == MenuItem.edit) {
        //   // ///logic for edit
        // }
      },
      child: SizedBox(
        height: 40.sp,
        width: 40.sp,
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
               Expanded(
                  flex: 1,
                  child:  SvgPicture.asset(Assets.editbusiness)),
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
                  child: 
                  SvgPicture.asset(Assets.sendbusiness),
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
                  child:
                   SvgPicture.asset(Assets.delete), 
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
      ],
    );
  }
}

enum MenuItem1 {
  
  edit,
  delete, 
  share, 
  }
