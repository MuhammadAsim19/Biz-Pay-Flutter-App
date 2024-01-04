import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
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
  String? country;
  String? city;
  String? privanceName;

  @override
  void initState() {
    context.read<GetAllCountryCubit>().getCountry();
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
                          itemsMap: ["dummy employee", "dummy 2", "dummy 3", ""]
                              .map((e) {
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
                              Navigator.pop(context);
                              countryList = state.country!;
                            }
                            if (state is GetAllCountryStateLoaded) {
                              privance = state.states!;
                            }
                            if (state is GetAllCountryCityLoaded) {
                              cityList = state.city!;
                            }
                            if (state is GetAllCountryError) {
                              Navigator.pop(context);
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
                                    context
                                        .read<GetAllCountryCubit>()
                                        .getCountryStates(value, false);
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
                                    privanceName = value;
                                    privanceName!.replaceAll('', '');
                                    setState(() {});

                                    context
                                        .read<GetAllCountryCubit>()
                                        .getCountryStates(privanceName!, true);
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
                            controller: businessNameController,
                            hintText: 'Address',
                            borderRadius: 40,
                            height: 56,
                            //maxline: 10,

                            // isBorderRequired: false,
                            textInputType: TextInputType.text),
                        10.y,
                        CustomTextFieldWithOnTap(
                            validateText: "Zip Code Required",
                            controller: businessHour,
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
                UpdateBusinessNotifier.addPageController.jumpToPage(1);
                UpdateBusinessNotifier.updateBusiness.value = 1;

                // if (_formKey.currentState!.validate()) {
                //   if (upload != null) {

                //     _addData();
                //     log("Here is the data of notifier${AddBusinessController.addBusiness.value.advantages.toString()}");
                //     uploadFiles = false;
                //     setState(() {});
                //   } else {
                //     uploadFiles = true;
                //     setState(() {});
                //   }
                // }
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
    print(widget.businessModel!.businessDescription);

    // city = widget.businessModel!.city;
    // country = widget.businessModel!.country;
    // employee = widget.businessModel?.numberOfEmployes ?? "";
    businessNameController.text = widget.businessModel?.name ?? "";
    businessHour.text = widget.businessModel?.businessHour ?? "";
    address.text = widget.businessModel!.address ?? "";
    zipCode.text = widget.businessModel!.zipcode ?? "";
    descriptionController.text == widget.businessModel!.businessDescription;
  }

  _addData() {
    // AddBusinessController.addBusiness.value = AddBusinessModel(
    //   name: businessNameController.text.trim(),
    //   industry: industryController.text.trim(),
    //   employee: ofEmployeeController.text.trim(),
    //   yearFound: yearFoundController.text.trim(),
    //   owner: ofOwnerController.text.trim(),
    //   description: descriptionController.text.trim(),
    //   businessHour: businessHour.text.trim(),
    //   registrationNumber: registrationNumber.text.trim(),
    //   advantages: advantages,
    //   documnets: [upload!.path],
    // );
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
