import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_message_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_tile_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/Components/notification_model.dart';

import 'Components/notification_tile.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  final List<NotificationsModel> chatData = [
    NotificationsModel(
        subtitle: 'You received new message from Gaberial',
        messageLength: '1',
        title: 'New chat',
        pr0fileImage: 'assets/images/notification.png',
        time: '3 day ago'),
    NotificationsModel(
        subtitle: 'You received new message from Gaberial',
        messageLength: '',
        title: 'New Listing',
        pr0fileImage: 'assets/images/notification.png',
        time: '1 day ago'),
    NotificationsModel(
        subtitle: 'Hello How Are Your',
        messageLength: '3',
        title: 'New Chat',
        pr0fileImage: 'assets/images/notification.png',
        time: '1 day ago'),
    NotificationsModel(
        subtitle: 'New Business has been listed in market',
        messageLength: '',
        title: 'New Listing',
        pr0fileImage: 'assets/images/notification.png',
        time: '1 day ago'),
    NotificationsModel(
        subtitle: 'New Business has been listed in market',
        messageLength: '3',
        title: 'New Chat',
        pr0fileImage: 'assets/images/notification.png',
        time: '1 day ago'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: Padding(
              padding: EdgeInsets.only(left: 24.0.sp),
              child: const BackArrowWidget(),
            ),
            backgroundColor: AppColors.whiteColor,
            title: AppText('Notifications',
                style: Styles.circularStdBold(context,
                    color: AppColors.blackColor, fontSize: 18.sp))),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChatTile(
                          data: chatData[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemCount: chatData.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
