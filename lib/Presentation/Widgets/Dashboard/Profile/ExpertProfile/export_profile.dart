import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:buysellbiz/Application/Services/PaymentServices/payment_services.dart';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/badgeModel.dart';
import 'package:buysellbiz/Domain/Packages/package_model.dart';
import 'package:buysellbiz/Domain/User/user_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/multi_item_picker.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/AllBadges/Controller/all_badges_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/AllBadges/State/all_badges_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/business_category_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/subscription_widget.dart';
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
  List stateList = [];
  List cityList = [];
  PackageModel? selectedPackage;
  List<PackageModel> packages = [];

  List industry = ['Automobile', "Education", 'Finance'];

  List profession = ['Annalists', "Marketing Manger", 'Sales Man'];
  List yearOfExperience = ["4", "10", "2"];

  List education = [
    'Master in Business',
    "Diploma in Business",
    'Business Marketing'
  ];

  Map validate = {
    "country": null,
    "city": null,
    "state": null,
    "image": null,
    "badge": null,
  };

  List<String?> selectedIndustryItems = [];
  List<String> selectedCertificates = [];
  List<String> selectedBadges = [];
  List<String> selectedServices = [];

  bool industryItemValid = false;
  bool educationCertificateValid = false;
  bool servicesListValid = false;
  bool imageValidator = false;

  // bool stateValidation = false;
  // bool countryValidation = false;
  // bool cityValidation = false;

  String? countryName;
  String? cityVal;

  String? countryNameForPassing;

  UserModel? data;

  String? professionVal;
  String? cityName;
  String? yearsOfExpr;
  String? indus;
  String? service;
  String? stateName;

  String? image;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    data = Data().user;
    context.read<BusinessCategoryCubit>().getCategory();
    context.read<GetAllCountryCubit>().getCountry();
    context.read<AllBadgesCubit>().getBadges();
    context.read<BrokerProfileCubit>().getPackages();
    emailController.text = data?.user?.email! ?? "malik@gmail.com";
    firstNameController.text = data?.user?.firstName ?? "";
    lastNameController.text = data?.user?.lastName ?? "";

    // image = data?.user?.profilePic ?? "";

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(image);

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
              data?.user?.profilePic != null
                  ? SizedBox(
                      height: 110.sp,
                      width: 110.sp,
                      child: CachedImage(
                          radius: 55.sp,
                          url: data!.user!.profilePic!.contains('https')
                              ? "${data?.user?.profilePic}"
                              : "${ApiConstant.baseurl}${data?.user?.profilePic}"),
                    )
                  : SizedBox(
                      height: 110.sp,
                      width: 110.sp,
                      child: CachedImage(
                          radius: 55.sp,
                          url:
                              "http://18.118.10.44:8000//assets/user_profile.png"),
                    ),
              20.y,
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldWithOnTap(
                        readOnly: true,
                        validateText: 'First Name Required',
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.profile),
                        controller: firstNameController,
                        hintText: 'First Name',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        readOnly: true,
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
                      value: professionVal,
                      validationText: 'Profession Required',
                      onChanged: (value) {
                        professionVal = value;
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
                        selectedServices = list;
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
                              log('$list $val ONchange');
                              selectedIndustryItems = val;
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
                    20.y,

                    AppText(AppStrings.badges,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    15.y,
                    BlocConsumer<AllBadgesCubit, AllBadgesState>(
                      listener: (BuildContext context, Object? state) {
                        if (state is AllBadgesErrorState) {
                          WidgetFunctions.instance
                              .snackBar(context, text: state.error);
                        }
                      },
                      builder: (BuildContext context, state) {
                        return (state is AllBadgesLoadedState)
                            ? MultiItemPicker(
                                validationText:
                                    "Pick atleast 1 badge, maximum 2 are allowed",
                                // listLimit: 2,
                                onChange: (list) {
                                  log(list.toString());
                                  selectedBadges.clear();
                                  for (var i = 0; i < list.length; i++) {
                                    selectedBadges.add(state.badges
                                        .firstWhere((element) =>
                                            element.title == list[i])
                                        .id!);
                                  }
                                  log(selectedBadges.toString());
                                },
                                hintText: 'Select 2 Badges',
                                getList:
                                    state.badges.map((e) => e.title).toList(),
                                hMar: 10,
                              )
                            : const SizedBox();
                      },
                    ),
                    // 20.y,

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
                        if (state is GetAllCountryLoaded) {
                          country = state.country!;
                        }
                        if (state is GetAllCountryStateLoaded) {
                          stateList = state.states!;
                        }
                        if (state is GetAllCountryCityLoaded) {
                          cityList = state.city!;
                        }
                        if (state is GetAllCountryError) {
                          WidgetFunctions.instance.showErrorSnackBar(
                              context: context, error: state.error);
                        }
                        if (state is CityAndStateError) {
                          WidgetFunctions.instance.showErrorSnackBar(
                              context: context, error: state.error);
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            DropDownField(
                              // value: countryName,
                              // isBorderRequired: true,
                              // hMargin: 0,
                              // vMargin: 0,
                              items: country.map((e) {
                                return DropItem(
                                  value: e,
                                  label: e,
                                );
                              }).toList(),
                              color: Colors.white,
                              hints: 'Country',

                              // hintText: 'Country',
                              // value: countryName,
                              errorText: validate['country'],
                              onSelected: (value) {
                                countryName = value;
                                countryNameForPassing =
                                    value.replaceAll(' ', '');
                                context
                                    .read<GetAllCountryCubit>()
                                    .getCountryStates(
                                        countryName: countryName,
                                        state: value,
                                        city: false);
                                setState(() {});
                              },
                            ),
                            DropDownField(
                              items: stateList.map((e) {
                                return DropItem(value: e, label: e);
                              }).toList(),
                              hints: 'Province/State',
                              errorText: validate['state'],
                              onSelected: (value) {
                                stateName = value;
                                // String modifiedText = value.replaceAll(' ', '');
                                setState(() {});

                                context
                                    .read<GetAllCountryCubit>()
                                    .getCountryStates(
                                        countryName: countryName,
                                        state: stateName,
                                        city: true);
                              },
                            ),
                            DropDownField(
                              items: cityList.map((e) {
                                return DropItem(value: e, label: e);
                              }).toList(),
                              hints: 'City',
                              errorText: validate['city'],
                              onSelected: (value) {
                                cityName = value;
                                setState(() {});
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    5.y,
                    CustomTextFieldWithOnTap(
                        validateText: "Zip Code Required",
                        prefixIcon: SvgPicture.asset(Assets.location),
                        borderRadius: 40.r,
                        controller: zipCode,
                        hintText: 'Zip Code',
                        textInputType: TextInputType.phone),
                    20.y,
                    AppText(AppStrings.education,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    15.y,
                    MultiItemPicker(
                      validationText: "Education Certificate Required",
                      onChange: (list) {
                        selectedCertificates = list;
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
                    15.y,

                    AppText(AppStrings.subscription,
                        style: Styles.circularStdMedium(context,
                            fontSize: 16.sp, color: AppColors.blackColor)),
                    10.y,
                    BlocConsumer<BrokerProfileCubit, BrokerProfileState>(
                      listener: (BuildContext context, state) {
                        if (state is BrokerPackagesErrorState) {
                          WidgetFunctions.instance.showErrorSnackBar(
                              context: context, error: state.error);
                        }
                        if (state is BrokerPackagesLoadedState) {
                          packages = state.packages;
                        }
                      },
                      builder:
                          (BuildContext context, BrokerProfileState state) =>
                              SubscriptionSelection(
                        onChange: (val) {
                          selectedPackage = val;
                          setState(() {});
                        },
                        selectedVal: selectedPackage?.id ?? '',
                        packages: packages,
                      ),
                    )
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
                    // onTap: () {
                    //   print('calling');
                    // },
                    onTap: callPublish,
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

  void callPublish() {
    log(selectedBadges.toString());
    try {
      bool countryValidation = _validate(
          errorText: 'Country Required', key: "country", val: countryName);
      bool cityValidation =
          _validate(errorText: 'City Required', key: "city", val: cityName);
      bool stateValidation =
          _validate(errorText: 'State Required', key: "state", val: stateName);
      bool badgesValidation = selectedBadges.length > 2;

      bool packageValidation = selectedPackage != null;
      log(badgesValidation.toString());
      if (_formKey.currentState!.validate() &&
          countryValidation &&
          cityValidation &&
          stateValidation &&
          !badgesValidation &&
          packageValidation) {
        _sendData();
      } else if (badgesValidation) {
        WidgetFunctions.instance.showErrorSnackBar(
            context: context, error: 'Maximum 2 badges are allowed');
      } else if (!packageValidation) {
        WidgetFunctions.instance.showErrorSnackBar(
            context: context, error: 'Select subscription to continue');
      }
    } catch (e) {
      log(e.toString());
      WidgetFunctions.instance
          .showErrorSnackBar(context: context, error: e.toString());
    }
  }

  bool _validate({String? val, String? errorText, String? key}) {
    if (val != null) {
      validate[key] = null;
      setState(() {});
      return true;
    } else {
      validate[key] = errorText;
      setState(() {});
      return false;
    }
  }

  _sendData() {
    // print(industryItem.toString());

    var dataMap = {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "educationAndCertification": jsonEncode(selectedCertificates),
      "description": description.text.trim(),
      "website": website.text.trim(),
      "designation": professionVal,
      "packageId": selectedPackage?.id ?? '',
      "badges": jsonEncode(selectedBadges),
      "servingArea": jsonEncode(
        {
          "country": countryName,
          "state": stateName,
          "city": cityName,
          "zipcode": zipCode.text.trim(),
        },
      ),
      "industries_served": jsonEncode(selectedIndustryItems),
      "experties": jsonEncode({
        "profession": professionVal,
        "yearOfExperience": yearsOfExpr,
        "services_offered": selectedServices,
      })
    };

    context
        .read<BrokerProfileCubit>()
        .createBroker(body: dataMap, imagePath: image, context: context);
  }
}
