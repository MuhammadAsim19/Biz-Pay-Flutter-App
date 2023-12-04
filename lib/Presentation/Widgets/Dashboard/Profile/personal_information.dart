import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/common_diaolg_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_date_picker.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_list_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/delete_account.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController calendarController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  List country = ['US', "Canada", 'UK'];

  String? countryName;

  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.personalLinfo,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              30.y,
              Stack(
                children: [
                  AssetImageWidget(
                    url: image == null ? Assets.dummyImage2 : image!,
                    radius: 60,
                    isCircle: true,
                  ),
                  Positioned(
                      top: 87.sp,
                      left: 88.sp,
                      child: InkWell(
                          onTap: () async {
                            image = await PickFile.pickSingleImage();
                            setState(() {});
                          },
                          child: Container(
                              width: 31,
                              height: 31,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF007BC0),
                                shape: CircleBorder(
                                  side:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(Assets.edit))))),
                ],
              ),
              20.y,
              Column(
                children: [
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: firstNameController,
                      hintText: 'Gabriel',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: lastNameController,
                      hintText: 'Tesse',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.blueCheck),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.message),
                      controller: emailController,
                      hintText: 'gabriel.example@gmail.com',
                      readOnly: true,
                      textInputType: TextInputType.emailAddress),
                  CustomDatePickerValidateWidget(
                    validator: (p0) {},
                    prefixIcon: SvgPicture.asset(Assets.calender),
                    controller: calendarController,
                    hintText: '22/09/96',
                  ),
                  10.y,
                  CustomDropDownWidget(
                    isBorderRequired: true,
                    hMargin: 0,
                    vMargin: 0,
                    prefixIcon: SvgPicture.asset(Assets.location),
                    itemsMap: country.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    hintText: 'Country',
                    value: countryName,
                    validationText: '',
                    onChanged: (value) {
                      country = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
              50.y,
              CustomButton(
                gapWidth: 7.w,
                imageHeight: 20.h,
                imageWidth: 20.w,
                leadingSvgIcon: true,
                width: 320.w,
                borderRadius: 40.r,
                onTap: () {
                  CustomDialog.dialog(
                      context,
                      const CommonDialog(
                        titleText: 'Profile updated successfully',
                        descriptionText:
                            'You’ve successfully updated your profile!',
                      ),
                      barrierDismissible: true);
                },
                text: AppStrings.update,
                bgColor: AppColors.primaryColor,
                textFontWeight: FontWeight.w700,
                textSize: 16.sp,
                textColor: AppColors.whiteColor,
              ),
              10.y,
              GestureDetector(
                onTap: () {
                  Navigate.to(context, DeleteAccount());
                },
                child: AppText('Delete my account',
                    style: Styles.circularStdMedium(context,
                        fontSize: 16.sp, color: AppColors.redColor)),
              ),
              30.y,
            ],
          ),
        ),
      ),
    );
  }
}
