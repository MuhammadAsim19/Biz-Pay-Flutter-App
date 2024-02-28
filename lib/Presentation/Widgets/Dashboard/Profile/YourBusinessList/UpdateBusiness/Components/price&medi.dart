import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_controller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ListBusiness/update_business_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePriceLocation extends StatefulWidget {
  const UpdatePriceLocation({super.key, this.businessModel});

  final BusinessModel? businessModel;

  @override
  State<UpdatePriceLocation> createState() => _UpdatePriceLocationState();
}

class _UpdatePriceLocationState extends State<UpdatePriceLocation> {
  List<Map<String, TextEditingController>> finincialDetails = [];

  TextEditingController salePriceController = TextEditingController();

  TextEditingController profileController = TextEditingController();

  TextEditingController revenueController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  TextEditingController addressController = TextEditingController();

  List countryList = [];
  List privance = [];
  List cityList = [];

  String? country;
  String? city;
  String? privanceName;

  var images;

  bool valid = false;

  int yearMi = 1;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _assignData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.y,
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText("Sale  price",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),

                        CustomTextFieldWithOnTap(
                            validateText: 'Sale Price Required',
                            controller: salePriceController,
                            hintText: 'Sale price (\$USD)',
                            borderRadius: 40,

                            // isBorderRequired: false,
                            textInputType: TextInputType.number),
                        20.y,
                        AppText("Financial detail",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),

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
                                      titleText:
                                          finincialDetails[index].keys.first,
                                      validateText:
                                          "${finincialDetails[index].keys.first} is Required ",
                                      controller:
                                          finincialDetails[index].values.first,
                                      hintText:
                                          finincialDetails[index].keys.first,
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
                        AppText('Upload image',
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,
                        AddImageWidget(
                          addText: "Uploads photos",
                          onTap: () async {
                            images = await PickFile.pickImage();
                            setState(() {});
                          },
                        ),
                        10.y,
                        AppText('At least 1 photos to improve check for sale',
                            style: Styles.circularStdRegular(context,
                                color: const Color(0xFFB0B0B0), fontSize: 14)),
                        AppText('Should be jpg, png, git format only',
                            style: Styles.circularStdRegular(context,
                                color: const Color(0xFFB0B0B0), fontSize: 14)),

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
                                          if (images.length == 0) {
                                            images = null;
                                          }
                                          //image = [];
                                        });
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 5.sp,
                                    );
                                  },
                                ),
                              )
                            : const SizedBox()
                      ],
                    )),
                80.y
              ],
            ),
          ),
          Positioned(
            bottom: 10.sp,
            left: 10.sp,
            child: BlocConsumer<UpdateBusinessCubit, UpdateBusinessState>(
              listener: (context, state) {
                print(state.toString());

                if (state is UpdateBusinessLoading) {
                  LoadingDialog.showLoadingDialog(context);
                }
                if (state is UpdateBusinessLoaded) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // CustomDialog.alertDialog(
                  //   context,
                  //   const AddSuccessDialog(),
                  // );
                  // Future.delayed(const Duration(seconds: 3));
                  // Navigate.toReplace(context, const YourBusiness());
                }
                if (state is UpdateBusinessError) {
                  Navigator.pop(context);
                  WidgetFunctions.instance
                      .showErrorSnackBar(context: context, error: state.error);
                }

                // TODO: implement listener
              },
              builder: (context, state) {
                return CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _addData();
                    }
                  },
                  textFontWeight: FontWeight.w500,
                  borderRadius: 30,
                  height: 56,
                  width: 1.sw / 1.25,
                  text: 'Publish',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _assignData() {
    widget.businessModel!.financialDetails?.forEach((element) {
      TextEditingController controller = TextEditingController();
      controller.text = element.revenue.toString();
      finincialDetails.add({
        element.financialYear!: controller,
      });
    });
    salePriceController.text = widget.businessModel!.salePrice.toString();
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
    );
    Map<String, dynamic> mapData =
        AddBusinessController.addBusiness.value.toJson();
    context.read<UpdateBusinessCubit>().updateBusinessById(
        images: images, data: mapData, bsId: currentModel.id);
  }
}
