import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_tile_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController controller = TextEditingController();

  ValueNotifier<int> chip = ValueNotifier(0);

  List<ChatTileModel> chatData = [
    ChatTileModel(
        message: 'Thank You',
        messageLength: '1',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/chat1.png',
        time: '03:30 PM'),
    ChatTileModel(
        message: 'Aqib Javid',
        messageLength: '',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/profile.png',
        time: '04:30 AM'),
    ChatTileModel(
        message: 'Hello How Are Your',
        messageLength: '3',
        name: 'Elizabeth',
        pr0fileImage: 'assets/images/chat2.png',
        time: '05:30 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Column(
              children: [
                25.y,
                Align(
                  alignment: Alignment.center,
                  child: AppText('Chat',
                      style: Styles.circularStdBold(context,
                          fontSize: 18.sp, fontWeight: FontWeight.w500)),
                ),
                20.y,
                CustomTextFieldWithOnTap(
                    prefixIcon: SvgPicture.asset('assets/images/search.svg'),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15.sp, horizontal: 10.sp),
                    borderRadius: 40,
                    controller: controller,
                    hintText: AppStrings.seerchChat,
                    textInputType: TextInputType.text),
                15.y,
                ValueListenableBuilder(
                  valueListenable: chip,
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            chip.value = 0;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 8),
                            decoration: ShapeDecoration(
                              color: chip.value == 0
                                  ? AppColors.borderColor
                                  : AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: const BorderSide(
                                    color: AppColors.borderColor),
                              ),
                            ),
                            child: Center(
                              child: AppText(
                                "All Chats",
                                style: Styles.circularStdBold(context,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ),
                        18.x,
                        InkWell(
                          onTap: () {
                            chip.value = 1;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22.50, vertical: 8),
                            decoration: ShapeDecoration(
                              color: chip.value == 1
                                  ? AppColors.borderColor
                                  : AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: const BorderSide(
                                    color: AppColors.borderColor),
                              ),
                            ),
                            child: Center(
                              child: AppText(
                                "Brokers",
                                style: Styles.circularStdBold(context,
                                    fontSize: 12.sp,
                                    color: AppColors.greyTextColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                25.y,
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    return ChatTile(
                      data: chatData[index],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
