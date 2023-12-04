import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_tile_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, this.backButton});

  bool? backButton;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  int chip = 0;

  List<ChatTileModel> chatData = [
    ChatTileModel(
        title: 'Man fashion collection',
        message: 'Hello How Are You Doing and asd,asldmakcnxjcbsdhb',
        messageLength: '1',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/chat1.png',
        time: '03:30 PM'),
    ChatTileModel(
        message: 'Aqib Javid',
        messageLength: '',
        title: 'Women Fashion',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/profile.png',
        time: '04:30 AM'),
    ChatTileModel(
        message: 'Hello How Are Your',
        messageLength: '3',
        title: 'Drop shipping and e-commerce website',
        name: 'Elizabeth',
        pr0fileImage: 'assets/images/chat2.png',
        time: '05:30 AM'),
  ];

  List<ChatTileModel> brokers = [
    ChatTileModel(
        title: 'Business broker',
        message: 'Thank You',
        messageLength: '1',
        name: 'Kamran Ali',
        pr0fileImage: 'assets/images/profile.png',
        time: '03:30 PM'),
    ChatTileModel(
        title: 'M&A Advisor',
        message: 'Hello ',
        messageLength: '',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/chat1.png',
        time: '04:30 AM'),
    ChatTileModel(
        title: 'Financial Advisor',
        message: 'How Are you Doing and what the current position',
        messageLength: '3',
        name: 'Elizabeth',
        pr0fileImage: 'assets/images/chat2.png',
        time: '05:30 AM'),
    ChatTileModel(
        title: 'M&A Advisor',
        message: 'Aqib Javid',
        messageLength: '',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/chat1.png',
        time: '04:30 AM'),
    ChatTileModel(
        title: 'Financial Advisor',
        message: 'How Are you Doing and what the current position',
        messageLength: '3',
        name: 'Elizabeth',
        pr0fileImage: 'assets/images/chat2.png',
        time: '05:30 AM'),
    ChatTileModel(
        title: 'Financial Advisor',
        message: 'How Are you Doing and what the current position',
        messageLength: '3',
        name: 'Elizabeth',
        pr0fileImage: 'assets/images/chat2.png',
        time: '05:30 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Chat',
          leading: widget.backButton,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            children: [
              // 25.y,
              // Align(
              //   alignment: Alignment.center,
              //   child: AppText('Chat',
              //       style: Styles.circularStdBold(context,
              //           fontSize: 18.sp, fontWeight: FontWeight.w500)),
              // ),
              CustomTextFieldWithOnTap(
                  filledColor: AppColors.searchFieldColor,
                  prefixIcon: SvgPicture.asset('assets/images/Search.svg'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
                  borderRadius: 40,
                  controller: controller,
                  hintText: AppStrings.seerchChat,
                  textInputType: TextInputType.text),
              15.y,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      chip = 0;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 8),
                      decoration: ShapeDecoration(
                        color: chip == 0
                            ? AppColors.borderColor
                            : AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: const BorderSide(color: AppColors.borderColor),
                        ),
                      ),
                      child: Center(
                        child: AppText(
                          "Business chat",
                          style:
                              Styles.circularStdBold(context, fontSize: 13.sp),
                        ),
                      ),
                    ),
                  ),
                  18.x,
                  InkWell(
                    onTap: () {
                      chip = 1;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22.50, vertical: 8),
                      decoration: ShapeDecoration(
                        color: chip == 1
                            ? AppColors.borderColor
                            : AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: const BorderSide(color: AppColors.borderColor),
                        ),
                      ),
                      child: Center(
                        child: AppText(
                          "Brokers",
                          style: Styles.circularStdBold(context,
                              fontSize: 13.sp, color: AppColors.greyTextColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              25.y,
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: chip == 0 ? chatData.length : brokers.length,
                  itemBuilder: (context, index) {
                    return ChatTile(
                      data: chip == 0 ? chatData[index] : brokers[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
