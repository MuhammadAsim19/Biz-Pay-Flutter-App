import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/Common/note_attachment_widget.dart';

class RequestGeneralDataWidget extends StatelessWidget {
  const RequestGeneralDataWidget({super.key, required this.badgesRequest});
  final BadgesRequest badgesRequest;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        6.y,
        AppText(
          'Business Name: ${badgesRequest.businessReff?.name}',
          style: Styles.circularStdMedium(context, fontSize: 18),
          maxLine: 3,
        ),
        20.y,
        Row(
          children: [
            AppText('Order for badge type: ',
                style: Styles.circularStdMedium(context, fontSize: 16)),
            AppText(badgesRequest.badgeReff?.title ?? '',
                style: Styles.circularStdRegular(context,
                    fontSize: 16, color: AppColors.greyTextColor)),
          ],
        ),
        4.y,
        Row(
          children: [
            AppText('Amount: ',
                style: Styles.circularStdMedium(context, fontSize: 16)),
            AppText('\$${badgesRequest.amount}',
                style: Styles.circularStdRegular(context,
                    fontSize: 16, color: AppColors.greyTextColor)),
            const Spacer(),
            CustomButton(
                height: 38,
                width: 70,
                onTap: () {},
                text: 'Chat',
                borderRadius: 25,
                textSize: 13),
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
