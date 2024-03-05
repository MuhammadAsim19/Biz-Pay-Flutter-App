import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:file_picker/file_picker.dart';

class SendBadgeRequest extends StatefulWidget {
  const SendBadgeRequest({super.key});

  @override
  State<SendBadgeRequest> createState() => _SendBadgeRequestState();
}

class _SendBadgeRequestState extends State<SendBadgeRequest> {
  PlatformFile? upload;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText("Send Badge Request",
                style: Styles.circularStdMedium(context, fontSize: 18.sp)),
            20.x,
          ],
        ),
        centerTitle: true,
        leadingWidth: 48.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.sp),
          child: const BackArrowWidget(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            10.y,
            AddImageWidget(
              attachFile: Assets.uploadAttachment,
              onTap: () async {
                var pickedFile = await PickFile.pickFiles();
                if (pickedFile != null) {
                  upload = pickedFile;
                  setState(() {});
                }
              },
              height: 82,
              width: 400.w,
              text: 'Upload Documents',
            ),
            upload != null
                ? DisplayFile(
                    file: upload,
                    onDeleteTap: () {
                      upload = null;
                      setState(() {});
                    },
                    index: 0,
                  )
                : 10.x,
            10.y,
            CustomTextFieldWithOnTap(
                maxline: 5,
                controller: controller,
                hintText: "Write Description",
                textInputType: TextInputType.text),
            20.y,
            CustomButton(onTap: () {}, text: "Send Request"),
            20.y,
          ],
        ),
      ),
    );
  }
}
