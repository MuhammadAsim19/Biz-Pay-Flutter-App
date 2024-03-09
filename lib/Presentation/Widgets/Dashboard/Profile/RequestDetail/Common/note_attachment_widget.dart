import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/download_file.dart';

class NoteAndAttachmentWidget extends StatelessWidget {
  const NoteAndAttachmentWidget({
    super.key,
    required this.noteTitle,
    required this.note,
    required this.attachmentTitle,
    this.attachment,
  });

  final String noteTitle;
  final String note;
  final String attachmentTitle;
  final String? attachment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(noteTitle,
            style: Styles.circularStdMedium(context, fontSize: 16)),
        AppText(note,
            maxLine: 1000,
            style: Styles.circularStdRegular(context,
                fontSize: 16, color: AppColors.greyTextColor)),
        10.y,
        AppText(attachmentTitle,
            style: Styles.circularStdMedium(context, fontSize: 16)),
        10.y,
        if (attachment != null)
          Row(
            children: [
              SvgPicture.asset(
                Assets.pdfIcon,
                width: 30,
                height: 30,
              ),
              10.x,
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        attachment != null ? attachment!.split('/').last : "",
                        maxLine: 2,
                        style:
                            Styles.circularStdMedium(context, fontSize: 13.sp)),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () async {
                    attachment != null
                        ? await DownloadFile.download(attachment!, context)
                        : null;
                  },
                  child: SvgPicture.asset(Assets.downloadIcon))
            ],
          ),
        12.y,
        const Divider(thickness: .4),
      ],
    );
  }
}
