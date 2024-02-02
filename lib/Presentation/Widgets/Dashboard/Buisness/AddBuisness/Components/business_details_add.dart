import 'dart:developer';

import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_controller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/business_category_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessAddDetails extends StatefulWidget {
  const BusinessAddDetails({super.key});

  @override
  State<BusinessAddDetails> createState() => _BusinessAddDetailsState();
}

class _BusinessAddDetailsState extends State<BusinessAddDetails> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController yearFoundController = TextEditingController();
  TextEditingController ofOwnerController = TextEditingController();
  TextEditingController ofEmployeeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController businessHour = TextEditingController();
  TextEditingController registrationNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AddBusinessModel? model;

  String? indurstry;

  String? foundYear;

  String? owner;

  String? employee;

  PlatformFile? upload;

  // List<Map<String, bool>> advantagesItems = [
  //
  // ];

  List<String> advantages = [];

  Map<String, dynamic> advantagesItems = {
    "Building": false,
    "Property": false,
    "Equipment": false,
    "Contracts": false
  };

  bool uploadFiles = false;

  List<BusinessCategory> catg = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    businessNameController.dispose();
    industryController.dispose();
    yearFoundController.dispose();
    ofOwnerController.dispose();
    ofEmployeeController.dispose();
    descriptionController.dispose();
    businessHour.dispose();
    registrationNumber.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      // bottomNavigationBar:       Container(
      //   height: 100,
      //   color: Colors.transparent,
      //
      //   child: Column(
      //     children: [
      //       Align(
      //         child: CustomButton(onTap: () {
      //
      //           AddNotifier.addPageController.jumpToPage(1);
      //           AddNotifier.addBusinessNotifier.value=1;
      //
      //         },
      //           textFontWeight: FontWeight.w500,
      //           borderRadius: 30,
      //           height: 56,
      //           text: 'Next' ,),
      //       ),
      //
      //       SizedBox(height: 10.sp,)
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.y,
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
                        return CustomDropDownWidget(
                          isBorderRequired: true,
                          prefixIcon: SvgPicture.asset(Assets.dropDownIcon),
                          hMargin: 0,
                          vMargin: 0,
                          itemsMap: state is BusinessCategoryLoaded
                              ? state.list!.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id, child: Text(e.title!));
                                }).toList()
                              : catg.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id, child: Text(e.title!));
                                }).toList(),
                          hintText: "Industry",
                          value: indurstry,
                          validationText: 'Industry Required',
                          onChanged: (value) {
                            industryController.text = value.toString();
                            indurstry = value;
                          },
                        );
                      },
                    ),

                    10.y,

                    /// year found drop down
                    CustomDropDownWidget(
                      isBorderRequired: true,
                      prefixIcon: SvgPicture.asset(Assets.dropDownIcon),
                      hMargin: 0,
                      vMargin: 0,
                      itemsMap: ["1990", "2000", "2004"].map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      hintText: "Found Year",
                      value: foundYear,
                      validationText: 'Found Year Required',
                      onChanged: (value) {
                        yearFoundController.text = value.toString();
                        foundYear = value;
                      },
                    ),
                    10.y,

                    CustomDropDownWidget(
                      isBorderRequired: true,
                      prefixIcon: SvgPicture.asset(Assets.dropDownIcon),
                      hMargin: 0,
                      vMargin: 0,
                      itemsMap: ["3", "2", "1"].map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      hintText: "# of owner",
                      value: owner,
                      validationText: 'Owner Required',
                      onChanged: (value) {
                        ofOwnerController.text = value;
                        owner = value;
                      },
                    ),

                    /// owner drop down

                    10.y,
                    CustomDropDownWidget(
                      prefixIcon: SvgPicture.asset(Assets.dropDownIcon),
                      isBorderRequired: true,
                      hMargin: 0,
                      vMargin: 0,
                      itemsMap: ["1", "2", "3"].map((e) {
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

                    /// description text
                    ///
                    CustomTextFieldWithOnTap(
                        validateText: 'Description Required',
                        controller: descriptionController,
                        hintText: 'Description',
                        borderRadius: 14,
                        height: 200,
                        maxline: 10,

                        // isBorderRequired: false,
                        textInputType: TextInputType.text),
                    10.y,
                    AppText("Business  Hour",
                        style: Styles.circularStdMedium(context, fontSize: 20)),
                    10.y,
                    CustomTextFieldWithOnTap(
                        validateText: 'Business Hours Required',
                        controller: businessHour,
                        hintText: 'Time to run business (hour per week)',
                        borderRadius: 40,
                        height: 56,
                        // isBorderRequired: false,
                        textInputType: TextInputType.number),
                    10.y,
                    AppText("Advantages",
                        style: Styles.circularStdMedium(context, fontSize: 20)),
                    10.y,

                    // CheckboxWithText(text: 'test', value: false, onChanged: (bool? value) {  },)
                    SizedBox(
                      child: Wrap(

                          // Add spacing between the checkbox widgets

                          children: [
                            for (MapEntry i in advantagesItems.entries)
                              SizedBox(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      //checkColor: AppColors.primaryColor,

                                      value: i.value,
                                      activeColor: AppColors.primaryColor,
                                      onChanged: (val) {
                                        advantages.contains(i.key)
                                            ? advantages.remove(i.key)
                                            : advantages.add(i.key);
                                        setState(() {
                                          advantagesItems[i.key] = val;
                                        });
                                        print(advantages.toList());
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        i.key,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ]),
                    ),
                    10.y,
                    AppText("Documents",
                        style: Styles.circularStdMedium(context, fontSize: 20)),
                    10.y,
                    CustomTextFieldWithOnTap(
                        validateText: "Business Registration Number Required",
                        controller: registrationNumber,
                        hintText: 'Business registration number',
                        borderRadius: 40,
                        height: 56,

                        // isBorderRequired: false,
                        textInputType: TextInputType.text),
                    10.y,
                    AddImageWidget(
                      onTap: () async {
                        var pickedFile = await PickFile.pickFiles();
                        if (pickedFile != null) {
                          upload = pickedFile;
                          setState(() {});
                        }
                      },
                      height: 62,
                      width: 123.w,
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
                    7.y,
                    uploadFiles == true
                        ? AppText("Files Required",
                            style: Styles.circularStdRegular(context,
                                fontSize: 12,
                                color: AppColors.redColor,
                                fontWeight: FontWeight.w400))
                        : 10.y,
                  ],
                )),
            30.y,
            CustomButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (upload != null) {
                    print(upload!.extension);
                    if (upload!.extension == "pdf") {
                      print(advantages);
                      if (advantages.isNotEmpty) {
                        AddNotifier.addPageController.jumpToPage(1);
                        AddNotifier.addBusinessNotifier.value = 1;
                        _addData();
                        log("Here is the data of notifier${AddBusinessController.addBusiness.value.advantages.toString()}");
                        uploadFiles = false;
                        setState(() {});
                      } else {
                        WidgetFunctions.instance.snackBar(context,
                            text: 'Add at least one advantage');
                      }
                    } else {
                      WidgetFunctions.instance
                          .snackBar(context, text: 'Upload only pdf files');
                    }
                  } else {
                    uploadFiles = true;
                    setState(() {});
                  }
                }
              },
              textFontWeight: FontWeight.w500,
              borderRadius: 30,
              height: 56,
              width: 1.sw / 0.5,
              text: 'Next',
            ),
            20.y,
          ],
        ),
      ),
    );
  }

  _addData() {
    print(advantages);
    print('here is data of employ ${ofEmployeeController.text}');
    print('here is data of  owner ${ofOwnerController.text}');

    AddBusinessController.addBusiness.value = AddBusinessModel(
      name: businessNameController.text.trim(),
      industry: industryController.text.trim(),
      employee: ofEmployeeController.text.trim(),
      yearFound: yearFoundController.text.trim(),
      owner: ofOwnerController.text.trim(),
      description: descriptionController.text.trim(),
      businessHour: businessHour.text.trim(),
      registrationNumber: registrationNumber.text.trim(),
      advantages: advantages,
      documnets: [upload!.path],
    );
  }
}
