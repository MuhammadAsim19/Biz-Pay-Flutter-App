import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:file_picker/file_picker.dart';

class AddDelivery extends StatefulWidget {
  const AddDelivery({super.key});

  @override
  State<AddDelivery> createState() => _AddDeliveryState();
}

class _AddDeliveryState extends State<AddDelivery> {
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
            AppText("Order Number",
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Business Name ',
                style: Styles.circularStdMedium(context, fontSize: 18)),
            4.y,
            AppText('Order Number : #11391s302',
                style: Styles.circularStdRegular(context,
                    fontSize: 16, color: AppColors.greyTextColor)),
            4.y,
            Row(
              children: [
                AppText('Order for badge type : ',
                    style: Styles.circularStdMedium(context, fontSize: 16)),
                AppText('Limousine',
                    style: Styles.circularStdRegular(context,
                        fontSize: 16.sp, color: AppColors.greyTextColor)),
              ],
            ),
            4.y,
            Row(
              children: [
                AppText('Order time : ',
                    style: Styles.circularStdMedium(context, fontSize: 16.sp)),
                AppText('2 days Ago',
                    style: Styles.circularStdRegular(context,
                        fontSize: 14.sp, color: AppColors.greyTextColor)),
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
            15.y,
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
            CustomButton(onTap: () {}, text: "Add Delivery"),
            20.y,
          ],
        ),
      ),
    );
  }
}
