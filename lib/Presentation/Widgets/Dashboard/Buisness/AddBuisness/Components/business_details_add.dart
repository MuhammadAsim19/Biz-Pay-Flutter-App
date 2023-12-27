import 'dart:developer';

import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_radio_button.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Common/widget_functions.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_controller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/business_category_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
import 'package:dotted_border/dotted_border.dart';
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

  List<String> advantages = [];

  bool uploadFiles = false;

  List<BusinessCategory> catg = [];

  @override
  void initState() {
    context.read<BusinessCategoryCubit>().getCategory();
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
      backgroundColor: Colors.transparent,

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

                        BlocConsumer<BusinessCategoryCubit,
                            BusinessCategoryState>(
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
                          itemsMap:
                              ["dummy owner", "dummy 2", "dummy 3"].map((e) {
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
                          itemsMap:
                              ["dummy employee", "dummy 2", "dummy 3"].map((e) {
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
                            height: 200.h,
                            maxline: 10,

                            // isBorderRequired: false,
                            textInputType: TextInputType.text),
                        10.y,
                        AppText("Business  Hour",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,
                        CustomTextFieldWithOnTap(
                            validateText: 'Business Hours Required',
                            controller: businessHour,
                            hintText: 'Time to run business (hour per week)',
                            borderRadius: 40,
                            height: 56,

                            // isBorderRequired: false,
                            textInputType: TextInputType.text),
                        10.y,
                        AppText("Advantages",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,

                        // CheckboxWithText(text: 'test', value: false, onChanged: (bool? value) {  },)
                        SizedBox(
                          width: 1.sw,
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            // Add spacing between the checkbox widgets

                            children: [
                              SizedBox(
                                width: 1.sw / 2.2,
                                child: CheckboxWithText(
                                  text: 'Building Property',
                                  value: false,
                                  onChanged: (value) {
                                    advantages.contains(value)
                                        ? advantages.remove(value)
                                        : advantages.add(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 1.sw / 2.9,
                                child: CheckboxWithText(
                                  text: 'Equipment',
                                  value: false,
                                  onChanged: (value) {
                                    advantages.contains(value)
                                        ? advantages.remove(value)
                                        : advantages.add(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 1.sw / 2.2,
                                child: CheckboxWithText(
                                  text: 'Contracts',
                                  value: false,
                                  onChanged: (value) {
                                    advantages.contains(value)
                                        ? advantages.remove(value)
                                        : advantages.add(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 1.sw / 2.9,
                                child: CheckboxWithText(
                                  text: 'Assets',
                                  value: false,
                                  onChanged: (value) {
                                    advantages.contains(value)
                                        ? advantages.remove(value)
                                        : advantages.add(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.y,
                        AppText("Documents",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,
                        CustomTextFieldWithOnTap(
                            validateText:
                                "Business Registration Number Required",
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
                          height: 62.h,
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
                // ClipRRect(
                //
                //   borderRadius: const BorderRadius.all(Radius.circular(12)),
                //   child:   Container(
                //     color: AppColors.dottedGreyColor,
                //     child: DottedBorder(
                //       borderType: BorderType.RRect,
                //       radius: const Radius.circular(12).r,
                //       padding: const EdgeInsets.symmetric(vertical: 35).r,
                //       color: AppColors.greyColor,
                //
                //       strokeWidth: 3,
                //
                //       dashPattern: const [2, 3],
                //       child:   GestureDetector(
                //         onTap: ()
                //         async {
                //         var pickedFile= await PickFile.pickFiles();
                //         if(pickedFile!= null) {
                //           print(pickedFile[0].name);
                //         }
                //         },
                //         child: Container(
                //           height: 62,
                //           width: 123,
                //           decoration: const BoxDecoration(
                //            // color: Colors.red
                //
                //           ),//color: AppColors.lightGreyColor),
                //
                //     child: SizedBox(
                //         width: 97,
                //         height: 40,
                //         child: Column(
                //
                //           children: [
                //
                //             SvgPicture.asset(Assets.addImageIcon),
                //
                //             AppText("Upload Document", style: Styles.circularStdRegular(context,fontSize: 12))
                //
                //           ],
                //
                //
                //         ),
                //     )
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
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
                  if (upload != null) {
                    AddNotifier.addPageController.jumpToPage(1);
                    AddNotifier.addBusinessNotifier.value = 1;
                    _addData();
                    log("Here is the data of notifier${AddBusinessController.addBusiness.value.advantages.toString()}");
                    uploadFiles = false;
                    setState(() {});
                  } else {
                    uploadFiles = true;
                    setState(() {});
                  }
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

  _addData() {
    print(upload!.path);

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
