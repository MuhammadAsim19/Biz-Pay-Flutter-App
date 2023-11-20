import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_message_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_tile_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/message_container.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/pop_munu.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({super.key, this.model});

  final ChatTileModel? model;
  final TextEditingController message = TextEditingController();

  final List<ChatMessageModel> chats = [
    ChatMessageModel(user: 'receiver', time: '11:20 PM', message: 'Hello'),
    ChatMessageModel(user: 'sender', time: '01:20 PM', message: 'Hi'),
    ChatMessageModel(
        user: 'receiver',
        time: '02:21 PM',
        message: 'I see your business in listing'),
    ChatMessageModel(
        user: 'sender',
        time: '03:30 PM',
        message: 'I wan to sell my business with more profit margin in it.'),
    ChatMessageModel(
        user: 'receiver',
        time: '02:20 PM',
        message: 'I would love to get more info about this'),
    ChatMessageModel(
        user: 'sender',
        time: '04:20 PM',
        message: 'business portfolio.pdf',
        file: 'assets/images/pdf_icon.png'),
    ChatMessageModel(user: 'receiver', time: '04:20 PM', message: 'Thank You'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Column(
              children: [
                16.y,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.sp),
                  child: Row(
                    children: [
                      const BackArrowWidget(),
                      10.x,
                      AssetImageWidget(
                          height: 50.h, width: 50.w, url: model!.pr0fileImage),
                      10.x,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(model!.name,
                              style: Styles.circularStdBold(context,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500)),
                          AppText('Online',
                              style: Styles.circularStdRegular(context,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyTextColor)),
                        ],
                      ),
                      const Spacer(),
                      const PopMenu(),
                    ],
                  ),
                ),
                13.y,
                const Divider(
                  color: AppColors.borderColor,
                  thickness: 2,
                ),
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        10.y,
                        Chip(
                            labelPadding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 2.sp),
                            backgroundColor: AppColors.borderColor,
                            label: AppText(
                              '16 May, 2023',
                              style: Styles.circularStdMedium(context),
                            )),
                        20.y,
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 24.sp),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MessageContainer(
                                modelData: chats[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15.sp,
                              );
                            },
                            itemCount: chats.length),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -5,
              child: SizedBox(
                height: 80.h,
                width: 1.sw,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomTextFieldWithOnTap(
                      prefixIcon: SvgPicture.asset('assets/images/attach.svg'),
                      suffixIcon: Container(
                          margin: EdgeInsets.only(right: 10.sp),
                          child: SvgPicture.asset('assets/images/send.svg')),
                      borderRadius: 40.sp,
                      controller: message,
                      hintText: 'Message',
                      textInputType: TextInputType.text),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
