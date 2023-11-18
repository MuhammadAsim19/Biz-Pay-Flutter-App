import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_message_model.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key, this.modelData});

  final ChatMessageModel? modelData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: modelData!.user == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(
                  right: modelData!.user == "receiver" ? 70.sp : 0,
                  left: modelData!.user == "sender" ? 70.sp : 0),
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
              decoration: BoxDecoration(
                borderRadius: modelData!.user == "receiver"
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp))
                    : BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp),
                        bottomLeft: Radius.circular(10.sp),
                      ),
                color: modelData!.user == "receiver"
                    ? AppColors.chatColor
                    : AppColors.primaryColor,
              ),
              child: modelData!.file != null
                  ? Row(
                      children: [
                        AssetImageWidget(
                          url: modelData!.file!,
                          height: 25.h,
                        ),
                        7.x,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(modelData?.message ?? "",
                                textScaleFactor: 1,
                                style: Styles.circularStdRegular(context,
                                    color: modelData!.user == "receiver"
                                        ? AppColors.blackColor
                                        : AppColors.whiteColor)),
                            Text('680kb' ?? "",
                                textScaleFactor: 1,
                                style: Styles.circularStdRegular(context,
                                    color: modelData!.user == "receiver"
                                        ? AppColors.blackColor
                                        : AppColors.whiteColor)),
                          ],
                        ),
                      ],
                    )
                  : Text(modelData?.message ?? "",
                      textScaleFactor: 1,
                      style: Styles.circularStdRegular(context,
                          color: modelData!.user == "receiver"
                              ? AppColors.blackColor
                              : AppColors.whiteColor)),
            ),
          ),
          8.y,
          Align(
            alignment: modelData!.user == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight,
            child: AppText('10:20 PM',
                style: Styles.circularStdRegular(context,
                    color: AppColors.greyTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
