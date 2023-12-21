import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_controller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';

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

  TextEditingController countryController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  TextEditingController addressController = TextEditingController();

  String? country;
  String? city;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
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
      // bottomNavigationBar: Container(
      //   color: Colors.transparent
      //   ,
      //   //height: 56.h,
      //   child:       CustomButton(onTap: () {
      //
      //     AddNotifier.addPageController.jumpToPage(2);
      //     AddNotifier.addBusinessNotifier.value=2;
      //
      //   },
      //     borderRadius: 30,
      //     height: 56,
      //     text: 'Next' ,),
      // ),
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
                            textInputType: TextInputType.text),
                        20.y,
                        AppText("Financial detail",
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),

                        /// reveenue text

                        // CustomTextFieldWithOnTap(
                        //     validateText: 'Revenue Price Required',
                        //     controller: revenueController,
                        //     hintText: '2023 Revenue (\$CAD)',
                        //     borderRadius: 40,
                        //     height: 56,
                        //     //maxline: 10,
                        //
                        //     // isBorderRequired: false,
                        //     textInputType: TextInputType.text),
                        //
                        // ///profile
                        // CustomTextFieldWithOnTap(
                        //     controller: profileController,
                        //     hintText: '2023 Profit (\$CAD)',
                        //     borderRadius: 40,
                        //     //height: 200.h,
                        //     //maxline: 10,
                        //
                        //     // isBorderRequired: false,
                        //     textInputType: TextInputType.text),
                        finincialDetails.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return 1.y;
                                },
                                itemBuilder: (context, index) {
                                  return CustomTextFieldWithOnTap(
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
                                      textInputType: TextInputType.text);
                                },
                                itemCount: finincialDetails.length)
                            : const SizedBox.shrink(),

                        CustomButton(
                          onTap: () {
                            finincialDetails.add(
                              {
                                "Revenue ${DateTime.now().year - 1} (USD)":
                                    TextEditingController()
                              },
                            );
                            finincialDetails.add(
                              {
                                "Profit ${DateTime.now().year - 1} (USD)":
                                    TextEditingController()
                              },
                            );
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
                            style: Styles.circularStdMedium(context,
                                fontSize: 20)),
                        10.y,

                        CustomDropDownWidget(
                          prefixIcon: SvgPicture.asset(Assets.dropDownIcon),
                          isBorderRequired: true,
                          hMargin: 0,
                          vMargin: 0,
                          itemsMap: ["CountryA", "CountryB"].map((e) {
                            return DropdownMenuItem(value: e, child: Text(e));
                          }).toList(),
                          hintText: "Country",
                          value: country,
                          validationText: 'Country Required',
                          onChanged: (value) {
                            countryController.text = value;
                            country = value;
                          },
                        ),

                        10.y,
                        CustomDropDownWidget(
                          prefixIcon: SvgPicture.asset(Assets.dropDownIcon),
                          isBorderRequired: true,
                          hMargin: 0,
                          vMargin: 0,
                          itemsMap: ["CityA", "CityB"].map((e) {
                            return DropdownMenuItem(value: e, child: Text(e));
                          }).toList(),
                          hintText: "City",
                          value: city,
                          validationText: 'City Required',
                          onChanged: (value) {
                            cityController.text = value;
                            city = value;
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
                            textInputType: TextInputType.text),
                      ],
                    )),
                60.y
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: CustomButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  AddNotifier.addPageController.jumpToPage(2);
                  AddNotifier.addBusinessNotifier.value = 2;
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

  _addData() {
    List<Map<String, String>> details = [];
    for (int i = 0; i < finincialDetails.length; i++) {
      details.add({
        finincialDetails[i].keys.first:
            finincialDetails[i].values.first.text.trim()
      });
    }

    AddBusinessModel currentModel = AddBusinessController.addBusiness.value;

    AddBusinessController.addBusiness.value = currentModel.copyWith(
      salesPrice: salePriceController.text.trim(),
      financialDetails: details,
      address: addressController.text.trim(),
      city: cityController.text.trim(),
      country: countryController.text.trim(),
      zipCode: zipCode.text.trim(),
    );
  }
}
