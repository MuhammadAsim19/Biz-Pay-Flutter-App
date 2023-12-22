import 'dart:convert';
import 'dart:io';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/multi_item_picker.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/business_category_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/broker_profile_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/get_all_country_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportProfile extends StatefulWidget {
  const ExportProfile({super.key});

  @override
  State<ExportProfile> createState() => _ExportProfileState();
}

class _ExportProfileState extends State<ExportProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController calendarController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  List services = ['Capital Raising', "IPO Advisory", 'Social Marketing'];

  List country = [];

  List industry = ['Automobile', "Education", 'Finance'];

  List profession = ['Annalists', "Marketing Manger", 'Sales Man'];
  List yearOfExperience = ["4", "10", "2"];

  List privance = [];

  List education = [
    'Master in Business',
    "Diploma in Business",
    'Business Marketing'
  ];

  List<String?> industryItem = [];

  List<String> educationCertificates = [];

  List<String> servicesList = [];

  bool industryItemValid = false;
  bool educationCertificateValid = false;
  bool servicesListValid = false;

  bool imageValidator = false;

  String? countryName;
  String? cityVal;

  String? profesionVal;
  String? cityName;
  String? yearsOfExpr;
  String? indus;
  String? service;
  String? privanceName;

  String? image;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    UserModel? data = Data().user;

    context.read<BusinessCategoryCubit>().getCategory();
    context.read<GetAllCountryCubit>().getCountry();

    emailController.text = data!.user?.email! ?? "malik@gmail.com";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(AppStrings.exportProfile,
                style: Styles.circularStdMedium(context, fontSize: 18.sp)),
            8.x,
            SvgPicture.asset('assets/images/report.svg'),
            30.x,
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              20.y,
              Stack(
                children: [
                  image == null
                      ? const AssetImageWidget(
                          url: Assets.dummyImage2,
                          radius: 60,
                          isCircle: true,
                        )
                      : Container(
                          height: 110.sp,
                          width: 110.sp,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(File(image!)),
                                  fit: BoxFit.cover)),
                        ),
                  Positioned(
                      top: 80.sp,
                      left: 75.sp,
                      child: SvgPicture.asset(Assets.blueElipse)),
                  Positioned(
                      top: 87.sp,
                      left: 83.sp,
                      child: InkWell(
                          onTap: () async {
                            image = await PickFile.pickSingleImage();
                            setState(() {});
                          },
                          child: SvgPicture.asset(Assets.edit))),
                ],
              ),
              20.y,
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldWithOnTap(
                        validateText: 'First Name Required',
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.profile),
                        controller: firstNameController,
                        hintText: 'First Name',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        validateText: "Last Name Required",
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.profile),
                        controller: lastNameController,
                        hintText: 'Last Name',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        validateText: "Email Required",
                        suffixIcon: SvgPicture.asset(Assets.blueCheck),
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.message),
                        controller: emailController,
                        hintText: 'Email',
                        readOnly: true,
                        textInputType: TextInputType.emailAddress),
                    20.y,
                    AppText(AppStrings.expertes,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    15.y,
                    CustomDropDownWidget(
                      isBorderRequired: true,
                      hMargin: 0,
                      vMargin: 0,
                      itemsMap: profession.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      hintText: 'Profession',
                      value: profesionVal,
                      validationText: 'Profession Required',
                      onChanged: (value) {
                        profesionVal = value;
                        setState(() {});
                      },
                    ),
                    15.y,
                    CustomDropDownWidget(
                      isBorderRequired: true,
                      hMargin: 0,
                      vMargin: 0,
                      itemsMap: yearOfExperience.map((e) {
                        return DropdownMenuItem(
                            value: e, child: Text(e.toString()));
                      }).toList(),
                      hintText: 'Years of experience',
                      value: yearsOfExpr,
                      validationText: 'Experience Required',
                      onChanged: (value) {
                        yearsOfExpr = value;
                        setState(() {});
                      },
                    ),
                    15.y,
                    MultiItemPicker(
                      validationText: 'Service Required',
                      onChange: (list) {
                        servicesList = list;
                        setState(() {});
                      },
                      hintText: 'Select services',
                      getList: services,
                      hMar: 10,
                    ),
                    20.y,
                    AppText(AppStrings.industries,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    15.y,

                    BlocConsumer<BusinessCategoryCubit, BusinessCategoryState>(
                      listener: (context, state) {
                        if (state is BusinessCategoryLoading) {
                          LoadingDialog.showLoadingDialog(context);
                        }
                        if (state is BusinessCategoryLoaded) {
                          Navigator.pop(context);
                        }
                        if (state is BusinessCategoryError) {
                          WidgetFunctions.instance.showErrorSnackBar(
                              context: context, error: state.error);
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is BusinessCategoryLoaded) {
                          return MultiItemPickerForCateg(
                            validationText: 'Industry Required',
                            onChange: (list, val) {
                              industryItem = val;
                              setState(() {});
                            },
                            hintText: 'Category',
                            getList: state.list!,
                            hMar: 10,
                          );
                        } else {
                          return 10.x;
                        }
                      },
                    ),

                    // CustomDropDownWidget(
                    //   isBorderRequired: true,
                    //   hMargin: 0,
                    //   vMargin: 0,
                    //   itemsMap: country.map((e) {
                    //     return DropdownMenuItem(value: e, child: Text(e));
                    //   }).toList(),
                    //   hintText: 'Automobile',
                    //   value: countryName,
                    //   validationText: '',
                    //   onChanged: (value) {
                    //     country = value;
                    //     setState(() {});
                    //   },
                    // ),
                    20.y,
                    AppText(AppStrings.serviceArea,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    15.y,
                    BlocConsumer<GetAllCountryCubit, GetAllCountryState>(
                      listener: (context, state) {
                        print(state);
                        if (state is GetAllCountryLoaded) {
                          print("in listener${state.country}");
                          country = state.country!;
                        }
                        if (state is GetAllCountryError) {
                          WidgetFunctions.instance.showErrorSnackBar(
                              context: context, error: state.error);
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return CustomDropDownWidget(
                          isBorderRequired: true,
                          hMargin: 0,
                          vMargin: 0,
                          itemsMap: country.map((e) {
                            return DropdownMenuItem(value: e, child: Text(e));
                          }).toList(),
                          hintText: 'Country',
                          value: countryName,
                          validationText: 'Country Required',
                          onChanged: (value) {
                            context
                                .read<GetAllCountryCubit>()
                                .getCountryStates(value);

                            countryName = value;
                            setState(() {});
                          },
                        );
                      },
                    ),
                    15.y,
                    BlocConsumer<GetAllCountryCubit, GetAllCountryState>(
                      listener: (context, state) {
                        // print(state);
                        // if (state is GetAllCountryLoading) {
                        //   LoadingDialog.showLoadingDialog(context);
                        // }
                        if (state is GetAllCountryStateLoaded) {
                          print("in listener${state.states}");
                          privance = state.states!;
                        }
                        if (state is GetAllCountryError) {
                          WidgetFunctions.instance.showErrorSnackBar(
                              context: context, error: state.error);
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return CustomDropDownWidget(
                          isBorderRequired: true,
                          hMargin: 0,
                          vMargin: 0,
                          itemsMap: privance.map((e) {
                            return DropdownMenuItem(value: e, child: Text(e));
                          }).toList(),
                          hintText: 'State/province',
                          value: privanceName,
                          validationText: 'State Required',
                          onChanged: (value) {
                            privanceName = value;
                            setState(() {});
                          },
                        );
                      },
                    ),
                    15.y,
                    CustomTextFieldWithOnTap(
                        validateText: "City Required",
                        prefixIcon: SvgPicture.asset(Assets.location),
                        borderRadius: 40.r,
                        controller: city,
                        hintText: 'City',
                        textInputType: TextInputType.text),
                    15.y,
                    CustomTextFieldWithOnTap(
                        validateText: "Zip Code Required",
                        prefixIcon: SvgPicture.asset(Assets.location),
                        borderRadius: 40.r,
                        controller: zipCode,
                        hintText: 'Zip Code',
                        textInputType: TextInputType.text),
                    20.y,
                    AppText(AppStrings.education,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    15.y,
                    MultiItemPicker(
                      validationText: "Education Certificate Required",
                      onChange: (list) {
                        educationCertificates = list;
                      },
                      hintText: 'Education/certificate',
                      getList: education,
                      hMar: 10,
                    ),
                    20.y,
                    AppText(AppStrings.website,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    5.y,
                    CustomTextFieldWithOnTap(
                        validateText: 'Site Link Required',
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.profile),
                        controller: website,
                        hintText: 'www.website.com',
                        textInputType: TextInputType.name),
                    5.y,
                    CustomTextFieldWithOnTap(
                        maxline: 4,
                        validateText: 'Description Required',
                        borderRadius: 20.r,
                        controller: description,
                        hintText: 'Description',
                        textInputType: TextInputType.name),
                  ],
                ),
              ),
              20.y,
              BlocConsumer<BrokerProfileCubit, BrokerProfileState>(
                listener: (context, state) {
                  if (state is BrokerProfileLoading) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is BrokerProfileLoaded) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                  if (state is BrokerProfileError) {
                    Navigator.pop(context);
                    WidgetFunctions.instance.showErrorSnackBar(
                        context: context, error: state.error);
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: state is BrokerProfileLoading
                        ? () {}
                        : () {
                            if (_formKey.currentState!.validate()) {
                              if (image != null) {
                                _sendData();
                              } else {
                                WidgetFunctions.instance.showErrorSnackBar(
                                    context: context, error: "Image Required");
                              }
                            }
                          },
                    text: state is BrokerProfileLoading
                        ? "Loading"
                        : 'Publish profile',
                    borderRadius: 25.sp,
                  );
                },
              ),
              10.y,
            ],
          ),
        ),
      ),
    );
  }

  _sendData() {
    // print(industryItem.toString());

    var dataMap = {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "educationAndCertification": jsonEncode(educationCertificates),
      "description": description.text.trim(),
      "website": website.text.trim(),
      "designation": profesionVal,
      "servingArea": jsonEncode(
        {
          "country": countryName,
          "state": privanceName,
          "city": city.text.trim(),
          "zipcode": zipCode.text.trim(),
        },
      ),
      "industries_served": jsonEncode(industryItem),
      "experties": jsonEncode({
        "profession": profesionVal,
        "yearOfExperience": yearsOfExpr,
        "services_offered": servicesList,
      })
    };

    context
        .read<BrokerProfileCubit>()
        .createBroker(body: dataMap, imagePath: image!);
  }
}
