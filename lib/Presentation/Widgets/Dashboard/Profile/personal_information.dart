import 'dart:io';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:buysellbiz/Presentation/Common/ContextWidgets/common_diaolg_widget.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Auth/SignUp/Components/country_picker.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/UpdateProfile/update_profile_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/get_all_country_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/delete_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  TextEditingController phone = TextEditingController();

  List countryList = [];

  String? countryName;

  String? image;

  UserModel? userData;
  String? countryCode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userData = Data.app.user;
    context.read<GetAllCountryCubit>().getCountry();
    firstNameController.text = userData?.user!.firstName ?? "";
    lastNameController.text = userData?.user!.lastName ?? "";
    emailController.text = userData?.user!.email ?? "";
    calendarController.text = userData?.user!.dob ?? "";
    countryName = userData?.user!.country ?? "";
    phone.text = userData?.user!.phoneNumber ?? "";
    countryCode = "+1";
    // countryName = userData!.user!.country;

    // countryList.add(userData!.user?.country ?? "");
    //
    // // countryList.add(countryName);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.personalLinfo,
        leading: true,
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
                  image != null
                      ? Container(
                          height: 110.sp,
                          width: 110.sp,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File(image!)),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        )
                      : userData?.user?.profilePic != null
                          ? SizedBox(
                              height: 110.sp,
                              width: 110.sp,
                              child: CachedImage(
                                  radius: 60,
                                  isCircle: true,
                                  url:
                                      "${ApiConstant.baseurl}/${userData!.user!.profilePic}"),
                            )
                          : const AssetImageWidget(
                              url: Assets.dummyImage2,
                              radius: 60,
                              isCircle: true,
                            ),
                  Positioned(
                      top: 83.sp,
                      left: 82.sp,
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFieldWithOnTap(
                        validateText: 'First Name Required',
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.profile),
                        controller: firstNameController,
                        hintText: 'Gabriel',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        validateText: 'Last Name Required',
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.profile),
                        controller: lastNameController,
                        hintText: 'Tesse',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        validateText: 'Email Required',
                        suffixIcon: SvgPicture.asset(Assets.blueCheck),
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.message),
                        controller: emailController,
                        hintText: 'gabriel.example@gmail.com',
                        readOnly: true,
                        textInputType: TextInputType.emailAddress),
                    userData?.user?.phoneNumber != null &&
                            userData!.user!.phoneNumber!.isNotEmpty
                        ? CustomTextFieldWithOnTap(
                            validateText: 'Phone Required',
                            // suffixIcon: SvgPicture.asset(Assets.blueCheck),
                            borderRadius: 40.r,
                            prefixIcon: SvgPicture.asset(Assets.call),
                            controller: phone,
                            hintText: '+1 2392302303',
                            readOnly: true,
                            textInputType: TextInputType.emailAddress)
                        : CountryPicker(
                            countrySelect: (value) {
                              countryCode = value!;
                              print(value);
                              setState(() {});
                            },
                            controller: phone,
                            validator: Validate.phone,
                            onTapField: false,
                          ),
                    10.y,
                    // BlocConsumer<GetAllCountryCubit, GetAllCountryState>(
                    //   listener: (context, state) {
                    //     if (state is GetAllCountryLoaded) {
                    //       countryList = state.country!;
                    //     }
                    //     if (state is GetAllCountryError) {
                    //       WidgetFunctions.instance.showErrorSnackBar(
                    //           context: context, error: state.error);
                    //     }
                    //     // TODO: implement listener
                    //   },
                    //   builder: (context, state) {
                    //     return CustomDropDownWidget(
                    //       isBorderRequired: true,
                    //       hMargin: 0,
                    //       vMargin: 0,
                    //       itemsMap: countryList.map((e) {
                    //         return DropdownMenuItem(value: e, child: Text(e));
                    //       }).toList(),
                    //       hintText: 'Country',
                    //       value: countryName,
                    //       validationText: 'Country Required',
                    //       onChanged: (value) {
                    //         countryName = value;
                    //         setState(() {});
                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
              50.y,
              BlocListener<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileLoading) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is UpdateProfileLoaded) {
                    Navigator.pop(context);
                    CustomDialog.dialog(
                        context,
                        const CommonDialog(
                          titleText: 'Profile updated successfully',
                          descriptionText:
                              'You’ve successfully updated your profile!',
                        ),
                        barrierDismissible: true);
                    // Future.delayed(const Duration(seconds: 2), () {
                    //   Navigator.pop(context);
                    //   Navigator.pop(context);
                    // });
                  }
                  if (state is UpdateProfileError) {
                    WidgetFunctions.instance.showErrorSnackBar(
                        context: context, error: state.error);
                  }
                  // TODO: implement listener
                },
                child: CustomButton(
                  gapWidth: 7.w,
                  imageHeight: 20.h,
                  imageWidth: 20.w,
                  leadingSvgIcon: true,
                  width: 320.w,
                  borderRadius: 40.r,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (image != null) {
                        _update();
                      } else if (userData?.user!.profilePic != null) {
                        _update();
                      } else {
                        WidgetFunctions.instance.showErrorSnackBar(
                            context: context, error: 'Image Required');
                      }
                    }
                  },
                  text: AppStrings.update,
                  bgColor: AppColors.primaryColor,
                  textFontWeight: FontWeight.w700,
                  textSize: 16.sp,
                  textColor: AppColors.whiteColor,
                ),
              ),
              15.y,
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

  _update() {
    print("here is image ${image}");
    print(countryCode);

    var data = {
      'firstName': firstNameController.text.trim(),
      'lastName': lastNameController.text.trim(),
      'phone': userData?.user?.phoneNumber == null
          ? "$countryCode${phone.text.trim()}"
          : phone.text.trim(),
    };
    context.read<UpdateProfileCubit>().updateProfile(body: data, image: image);
  }
}
