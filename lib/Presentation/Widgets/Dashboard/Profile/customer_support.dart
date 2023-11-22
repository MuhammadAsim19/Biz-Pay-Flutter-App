import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  TextEditingController helpController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController remarkController = TextEditingController();

  List how = ['Admin', "Business Owner", 'New Seller'];

  String? ho;

  var images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(
        title: AppStrings.customerSupport,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.y,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDownWidget(
                    hMargin: 0,
                    vMargin: 0,
                    value: ho,
                    itemsMap: how.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (onChanged) {
                      helpController.text = onChanged.toString();
                    },
                    prefixIcon: SvgPicture.asset(Assets.person),
                    hintText: 'How can we help you?',
                    validationText: 'Text',
                  ),
                  10.y,
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: nameController,
                      hintText: 'Name',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.message),
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress),
                  CustomTextFieldWithOnTap(
                      height: 100.h,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 10.sp),
                      maxline: 5,
                      borderRadius: 10.r,
                      controller: remarkController,
                      hintText: 'Remark',
                      textInputType: TextInputType.emailAddress),
                ],
              ),

// 189.y,
            35.y,

              AddImageWidget(
                  height: 66.h,
                  width: 142.w,
                  text: 'Upload Attachment',
                  onTap: () async {
                    images = await PickFile.pickImage();
                    setState(() {});
                  }),

              10.y,
              images != null
                  ? SizedBox(
                      height: 100.h,
                      width: 1.sw,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: images!.length,
                        itemBuilder: (context, index) {
                          return DisplayFileImage(
                            fileImage: images![index].toString(),
                            onDeleteTap: () {
                              setState(() {
                                images!.removeAt(index);
                                //image = [];
                              });
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 5.sp,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
50.y,
            //const Spacer(),
              CustomButton(
                gapWidth: 7.w,
                imageHeight: 20.h,
                imageWidth: 20.w,
                leadingSvgIcon: true,
                width: 320.w,
                borderRadius: 40.r,
                onTap: () {},
                text: AppStrings.submit,
                bgColor: AppColors.primaryColor,
                textFontWeight: FontWeight.w700,
                textSize: 16.sp,
                textColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
