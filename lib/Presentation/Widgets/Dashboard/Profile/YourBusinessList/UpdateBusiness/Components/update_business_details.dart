import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_controller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ListBusiness/update_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/get_all_country_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/UpdateBusiness/Controller/update_business_notifer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBusinessDetails extends StatefulWidget {
  const UpdateBusinessDetails({super.key, this.businessModel});

  final BusinessModel? businessModel;

  @override
  State<UpdateBusinessDetails> createState() => _UpdateBusinessDetailsState();
}

class _UpdateBusinessDetailsState extends State<UpdateBusinessDetails> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController ofEmployeeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController businessHour = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AddBusinessModel? model;
  String? employee;
  bool uploadFiles = false;
  List countryList = [];
  List privance = [];
  List cityList = [];
  List employ = ["23", "22", "11", "32"];
  String? country;
  String? city;
  String? privanceName;

  @override
  void initState() {
    employ.add(widget.businessModel!.numberOfEmployes);
    countryList.add(widget.businessModel!.country);
    cityList.add(widget.businessModel!.city);
    // privance.add(widget.businessModel!.privence);

    _assignData();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    businessNameController.dispose();
    ofEmployeeController.dispose();
    descriptionController.dispose();
    businessHour.dispose();
    zipCode.dispose();
    address.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.y,
                AppText("Business  Detail",
                    style: Styles.circularStdMedium(context, fontSize: 20)),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFieldWithOnTap(
                            validateText: 'Business Name Required',
                            controller: businessNameController,
                            hintText: 'Business Name',
                            borderRadius: 40,
                            height: 36,

                            // isBorderRequired: false,
                            textInputType: TextInputType.text),
                        10.y,
                        CustomDropDownWidget(
                          prefixIcon: SvgPicture.asset(Assets.dropDownIcon),
                          isBorderRequired: true,
                          hMargin: 0,
                          vMargin: 0,
                          itemsMap: employ.map((e) {
                            return DropdownMenuItem(value: e, child: Text(e));
                          }).toList(),
                          hintText: "# of employees",
                          value: employee,
                          validationText: 'Employee Required',
                          onChanged: (value) {
                            ofEmployeeController.text = value;
                            employee = value;
                          },
                        ),
                        10.y,
                        AppText("Business  Hour",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        CustomTextFieldWithOnTap(
                            validateText: 'Business Hours Required',
                            controller: businessHour,
                            hintText: 'Time to run business (hour per week)',
                            borderRadius: 40,
                            height: 56,

                            // isBorderRequired: false,
                            textInputType: TextInputType.text),
                        AppText("Location",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,
                        BlocConsumer<GetAllCountryCubit, GetAllCountryState>(
                          listener: (context, state) {
                            if (state is GetAllCountryLoading) {
                              LoadingDialog.showLoadingDialog(context);
                            }
                            print(state);
                            if (state is GetAllCountryLoaded) {
                              Navigator.of(context).pop(true);
                              countryList = state.country!;
                            }
                            if (state is GetAllCountryStateLoaded) {
                              privance = state.states!;
                            }
                            if (state is GetAllCountryCityLoaded) {
                              cityList = state.city!;
                              cityList.add(widget.businessModel!.city);
                            }
                            if (state is GetAllCountryError) {
                              Navigator.pop(context);
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
                                CustomDropDownWidget(
                                  isBorderRequired: true,
                                  hMargin: 0,
                                  vMargin: 0,
                                  itemsMap: countryList.map((e) {
                                    return DropdownMenuItem(
                                        value: e, child: Text(e));
                                  }).toList(),
                                  hintText: 'Country',
                                  value: country,
                                  validationText: 'Country Required',
                                  onChanged: (value) {
                                    privanceName = null;
                                    privance.clear();
                                    cityList.clear();
                                    city = null;

                                    context
                                        .read<GetAllCountryCubit>()
                                        .getCountryStates(
                                            countryName: value, city: false);
                                    // cityController.text = value;
                                    country = value;
                                    setState(() {});
                                  },
                                ),
                                10.y,
                                CustomDropDownWidget(
                                  isBorderRequired: true,
                                  hMargin: 0,
                                  vMargin: 0,
                                  itemsMap: privance.map((e) {
                                    return DropdownMenuItem(
                                        value: e, child: Text(e));
                                  }).toList(),
                                  hintText: 'Province/State',
                                  value: privanceName,
                                  validationText: 'Province/State Required',
                                  onChanged: (value) {
                                    cityList.clear();
                                    city = null;
                                    setState(() {});

                                    context
                                        .read<GetAllCountryCubit>()
                                        .getCountryStates(
                                            countryName: country,
                                            state: value,
                                            city: true);
                                  },
                                ),
                                10.y,
                                CustomDropDownWidget(
                                  isBorderRequired: true,
                                  hMargin: 0,
                                  vMargin: 0,
                                  itemsMap: cityList.map((e) {
                                    return DropdownMenuItem(
                                        value: e, child: Text(e));
                                  }).toList(),
                                  hintText: 'City',
                                  value: city,
                                  validationText: 'City Required',
                                  onChanged: (value) {
                                    city = value;
                                    // cityController.text = value;
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
                            controller: address,
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
                            textInputType: TextInputType.text),
                        CustomTextFieldWithOnTap(
                            validateText: 'Description Required',
                            controller: descriptionController,
                            hintText: 'Description',
                            borderRadius: 14,
                            height: 200.h,
                            maxline: 10,
                            textInputType: TextInputType.text),
                        10.y,
                      ],
                    )),
                70.y
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: CustomButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  UpdateBusinessNotifier.updateBusiness.value = 1;
                  UpdateBusinessNotifier.addPageController.jumpToPage(1);
                  _addData();
                }
              },
              textFontWeight: FontWeight.w500,
              borderRadius: 30,
              height: 56,
              width: 1.sw / 1.25,
              text: 'Next',
            ),
          )
        ],
      ),
    );
  }

  _assignData() {
    print("here is Business Privnce Name ${widget.businessModel!.privence}");
    privanceName = widget.businessModel!.privence;
    city = widget.businessModel!.city;
    country = widget.businessModel!.country;
    employee = widget.businessModel!.numberOfEmployes;
    businessNameController.text = widget.businessModel?.name ?? "";
    businessHour.text = widget.businessModel?.businessHour ?? "";
    address.text = widget.businessModel!.address ?? "";
    zipCode.text = widget.businessModel!.zipcode ?? "";
    descriptionController.text =
        widget.businessModel!.businessDescription ?? "";
  }

  _addData() {
    AddBusinessController.addBusiness.value = AddBusinessModel(
      id: widget.businessModel!.id,
      name: businessNameController.text.trim(),
      employee: ofEmployeeController.text.trim(),
      description: descriptionController.text.trim(),
      businessHour: businessHour.text.trim(),
      address: address.text.trim(),
      zipCode: zipCode.text.trim(),
      country: country,
      city: city,
      state: privanceName,
    );
  }
}

class CheckboxWithText extends StatefulWidget {
  final String text;
  final bool value;
  final Function(String val) onChanged;

  const CheckboxWithText({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CheckboxWithText> createState() => _CheckboxWithTextState();
}

bool? value;

class _CheckboxWithTextState extends State<CheckboxWithText> {
  @override
  void initState() {
    // TODO: implement initState
    value = widget.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          //checkColor: AppColors.primaryColor,

          value: value,
          activeColor: AppColors.primaryColor,
          onChanged: (val) {
            setState(() {
              value = val;
              widget.onChanged(widget.text);
            });
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
