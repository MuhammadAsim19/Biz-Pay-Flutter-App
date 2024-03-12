import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_navigation.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/Common/note_attachment_widget.dart';

class RequestGeneralDataWidget extends StatelessWidget {
  const RequestGeneralDataWidget(
      {super.key, required this.badgesRequest, required this.showChat});

  final BadgesRequest badgesRequest;
  final bool showChat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        6.y,
        AppText(
          '${badgesRequest.businessReff?.name ?? badgesRequest.expertReff?.fullName}',
          style: Styles.circularStdMedium(context, fontSize: 18),
          maxLine: 4,
        ),
        20.y,
        Row(
          children: [
            AppText('Order for badge type: ',
                style: Styles.circularStdMedium(context, fontSize: 16)),
            Expanded(
              child: AppText(badgesRequest.badgeReff?.title ?? '',
                  maxLine: 2,
                  style: Styles.circularStdRegular(context,
                      fontSize: 16, color: AppColors.greyTextColor)),
            ),
          ],
        ),
        4.y,
        Row(
          children: [
            AppText('Amount: ',
                style: Styles.circularStdMedium(context, fontSize: 16)),
            Expanded(
              child: AppText('\$${badgesRequest.amount}',
                  style: Styles.circularStdRegular(context,
                      fontSize: 16, color: AppColors.greyTextColor)),
            ),
            const Spacer(),
            if (showChat)
              Flexible(
                child: ValueListenableBuilder(
                  valueListenable: ChatNavigation.brokerChatLoading,
                  builder: (context, value, child) {
                    return value == 1
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            height: 38,
                            width: 70,
                            onTap: () {
                              if (badgesRequest.expertReff?.id != null &&
                                  badgesRequest.expertReff?.userInfo != null) {
                                ChatNavigation.initChatWithBroker(
                                    context,
                                    badgesRequest.expertReff!.userInfo!,
                                    badgesRequest.expertReff!.id!);
                              }
                            },
                            text: 'Chat',
                            borderRadius: 25,
                            textSize: 13);
                  },
                ),
              ),
          ],
        ),
        20.y,
        NoteAndAttachmentWidget(
            noteTitle: 'Business Note',
            note: badgesRequest.message ?? '',
            attachmentTitle: 'Attachment',
            attachment: badgesRequest.attachment),
      ],
    );
  }
}
