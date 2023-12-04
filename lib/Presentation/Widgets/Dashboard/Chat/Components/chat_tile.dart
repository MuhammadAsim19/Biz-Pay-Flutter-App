import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_tile_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_details.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, this.data});

  final ChatTileModel? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.to(
            context,
            ChatDetailsScreen(
              model: data,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.borderColor)),
        child: Row(
          children: [
            AssetImageWidget(
                height: 50.h, width: 50.w, url: data!.pr0fileImage),
            15.x,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(data?.name ?? "",
                      style: Styles.circularStdBold(context,
                          fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  2.y,
                  AppText(data?.title ?? "",
                      style: Styles.circularStdRegular(context,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor)),
                  2.y,
                  AppText(data!.message,
                      style: Styles.circularStdRegular(context,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyTextColor)),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(data!.time,
                    style: Styles.circularStdRegular(context,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyTextColor)),
                20.y,
                data!.messageLength.isNotEmpty
                    ? CircleAvatar(
                        radius: 10.sp,
                        child: Center(
                          child: AppText(
                            data!.messageLength,
                            style: Styles.circularStdRegular(context,
                                color: AppColors.whiteColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
