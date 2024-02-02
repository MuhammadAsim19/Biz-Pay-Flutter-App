import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_controller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/get_all_country_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceLocation extends StatefulWidget {
  PriceLocation({super.key});

  @override
  State<PriceLocation> createState() => _PriceLocationState();
}

class _PriceLocationState extends State<PriceLocation> {
  List<Map<String, TextEditingController>> finincialDetails = [];

  TextEditingController salePriceController = TextEditingController();

  TextEditingController profileController = TextEditingController();

  TextEditingController revenueController = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  TextEditingController addressController = TextEditingController();

  Map validate = {
    "country": null,
    "city": null,
    "state": null,
    "image": null,
  };

  List countryList = [];
  List stateList = [];
  List cityList = [];

  String? countryName;
  String? cityName;
  String? stateName;

  int yearMi = 1;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<GetAllCountryCubit>().getCountry();

    finincialDetails.add(
      {"Revenue ${DateTime.now().year} (USD)": TextEditingController()},
    );

    finincialDetails
        .add({"Profit ${DateTime.now().year} (USD)": TextEditingController()});

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText("Sale  price",
                    style: Styles.circularStdMedium(context, fontSize: 20)),

                CustomTextFieldWithOnTap(
                    validateText: 'Sale Price Required',
                    controller: salePriceController,
                    hintText: 'Sale price (\$USD)',
                    borderRadius: 40,

                    // isBorderRequired: false,
                    textInputType: TextInputType.number),
                20.y,
                AppText("Financial detail",
                    style: Styles.circularStdMedium(context, fontSize: 20)),

                /// reveenue text

                finincialDetails.isNotEmpty
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return 1.y;
                        },
                        itemBuilder: (context, index) {
                          return CustomTextFieldWithOnTap(
                              validateText:
                                  "${finincialDetails[index].keys.first} is Required ",
                              controller: finincialDetails[index].values.first,
                              hintText: finincialDetails[index].keys.first,
                              borderRadius: 40,
                              //height: 200.h,
                              //maxline: 10,

                              // isBorderRequired: false,
                              textInputType: TextInputType.number);
                        },
                        itemCount: finincialDetails.length)
                    : const SizedBox.shrink(),

                CustomButton(
                  onTap: () {
                    finincialDetails.add(
                      {
                        "Revenue ${DateTime.now().year - yearMi} (USD)":
                            TextEditingController()
                      },
                    );
                    finincialDetails.add(
                      {
                        "Profit ${DateTime.now().year - yearMi} (USD)":
                            TextEditingController()
                      },
                    );

                    yearMi++;
                    setState(() {});
                  },
                  text: "+ Add previous year 2022",
                  width: 180.sp,
                  height: 40.0,
                  textSize: 12,
                  borderRadius: 40,
                  textFontWeight: FontWeight.w500,
                ),
                10.y,
                AppText("Location",
                    style: Styles.circularStdMedium(context, fontSize: 20)),
                10.y,
                BlocConsumer<GetAllCountryCubit, GetAllCountryState>(
                  listener: (context, state) {
                    print(state);
                    if (state is GetAllCountryLoaded) {
                      print("in listener${state.country}");
                      countryList = state.country!;
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
                          items: countryList.map((e) {
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
                            context.read<GetAllCountryCubit>().getCountryStates(
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

                            context.read<GetAllCountryCubit>().getCountryStates(
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

                10.y,
                CustomTextFieldWithOnTap(
                    validateText: 'Address Required',
                    controller: addressController,
                    hintText: 'Address',
                    borderRadius: 40,
                    height: 56,
                    //maxline: 10,

                    // isBorderRequired: false,
                    textInputType: TextInputType.text),
                10.y,
                CustomTextFieldWithOnTap(
                    validateText: "Zip Code Required",
                    controller: zipCode,
                    hintText: 'Zip Code',
                    borderRadius: 40,
                    //height: 200.h,
                    //maxline: 10,
                    // isBorderRequired: false,
                    textInputType: TextInputType.number),
                30.y,
                CustomButton(
                  onTap: _callData,
                  textFontWeight: FontWeight.w500,
                  borderRadius: 30,
                  height: 56,
                  width: 1.sw / 0.50,
                  text: 'Next',
                ),
                20.y,
              ],
            )),
      ),
    );
  }

  void _callData() {
    bool countryValidation = _validate(
        errorText: 'Country Required', key: "country", val: countryName);
    bool cityValidation =
        _validate(errorText: 'City Required', key: "city", val: cityName);
    bool stateValidation =
        _validate(errorText: 'State Required', key: "state", val: stateName);

    if (_formKey.currentState!.validate() &&
        cityValidation &&
        countryValidation &&
        stateValidation) {
      AddNotifier.addPageController.jumpToPage(2);
      AddNotifier.addBusinessNotifier.value = 2;
      _addData();
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

  _addData() {
    List<Map<String, String>> details = [];
    for (int i = 0; i < finincialDetails.length; i++) {
      details.add({
        "financialYear": finincialDetails[i].keys.first,
        "revenue": finincialDetails[i].values.first.text.trim()
      });
    }

    AddBusinessModel currentModel = AddBusinessController.addBusiness.value;

    AddBusinessController.addBusiness.value = currentModel.copyWith(
      salesPrice: salePriceController.text.trim(),
      financialDetails: details,
      address: addressController.text.trim(),
      city: cityName,
      country: countryName,
      zipCode: zipCode.text.trim(),
      state: stateName,
    );

    print(currentModel.documnets.toString());

    salePriceController.clear();
    addressController.clear();
    countryName = null;
    cityName = null;
    stateName = null;
    zipCode.clear();
  }
}
