import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_date_picker.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/multi_item_picker.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';

class ExportProfile extends StatefulWidget {
  const ExportProfile({super.key});

  @override
  State<ExportProfile> createState() => _ExportProfileState();
}

class _ExportProfileState extends State<ExportProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController website = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController calendarController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  List services = ['Capital Raising', "IPO Advisory", 'Social Marketing'];

  List country = ['US', "Pakistan", 'UK'];

  List industry = ['Automobile', "Education", 'Finance'];

  List profession = ['Annalists', "Marketing Manger", 'Sales Man'];
  List yearOfExperience = ['5 Year', "10 Year", '2 years'];

  List city = ['Peshawar', "Islamabad", 'Karachi'];

  List privance = ['Peshawar', "Islamabad", 'Karachi'];

  List education = [
    'Master in Business',
    "Diploma in Business",
    'Business Marketing'
  ];

  String? countryName;

  String? cityVal;

  String? profesionVal;
  String? cityName;
  String? yearsOfExpr;
  String? indus;
  String? service;
  String? privanceName;

  String? image;

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
                  AssetImageWidget(
                    url: image == null ? Assets.dummyImage2 : image!,
                    radius: 60,
                    isCircle: true,
                  ),
                  Positioned(
                      top: 80.sp,
                      left: 80.sp,
                      child: SvgPicture.asset(Assets.blueElipse)),
                  Positioned(
                      top: 87.sp,
                      left: 88.sp,
                      child: InkWell(
                          onTap: () async {
                            image = await PickFile.pickSingleImage();
                            setState(() {});
                          },
                          child: SvgPicture.asset(Assets.edit))),
                ],
              ),
              20.y,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: firstNameController,
                      hintText: 'Gabriel',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: lastNameController,
                      hintText: 'Tesse',
                      textInputType: TextInputType.name),
                  CustomTextFieldWithOnTap(
                      suffixIcon: SvgPicture.asset(Assets.blueCheck),
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.message),
                      controller: emailController,
                      hintText: 'gabriel.example@gmail.com',
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
                    validationText: '',
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
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    hintText: 'Years of experience',
                    value: yearsOfExpr,
                    validationText: '',
                    onChanged: (value) {
                      yearsOfExpr = value;
                      setState(() {});
                    },
                  ),
                  15.y,
                  MultiItemPicker(
                    onChange: (list) {},
                    hintText: 'Select services',
                    getList: services,
                    hMar: 10,
                  ),
                  20.y,
                  AppText(AppStrings.industries,
                      style: Styles.circularStdMedium(context,
                          fontSize: 16.sp, color: AppColors.blackColor)),
                  15.y,
                  MultiItemPicker(
                    onChange: (list) {},
                    hintText: 'Automobile',
                    getList: industry,
                    hMar: 10,
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
                  CustomDropDownWidget(
                    isBorderRequired: true,
                    hMargin: 0,
                    vMargin: 0,
                    itemsMap: country.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    hintText: 'Country',
                    value: countryName,
                    validationText: '',
                    onChanged: (value) {
                      countryName = value;
                      setState(() {});
                    },
                  ),
                  15.y,
                  CustomDropDownWidget(
                    isBorderRequired: true,
                    hMargin: 0,
                    vMargin: 0,
                    itemsMap: privance.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    hintText: 'State/province',
                    value: privanceName,
                    validationText: '',
                    onChanged: (value) {
                      cityName = value;
                      setState(() {});
                    },
                  ),
                  15.y,
                  CustomDropDownWidget(
                    isBorderRequired: true,
                    hMargin: 0,
                    vMargin: 0,
                    itemsMap: city.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    hintText: 'City',
                    value: cityName,
                    validationText: '',
                    onChanged: (value) {
                      cityName = value;
                      setState(() {});
                    },
                  ),
                  20.y,
                  AppText(AppStrings.education,
                      style: Styles.circularStdMedium(context,
                          fontSize: 16.sp, color: AppColors.blackColor)),
                  15.y,
                  MultiItemPicker(
                    onChange: (list) {},
                    hintText: 'Education/certificate',
                    getList: education,
                    hMar: 10,
                  ),
                  20.y,
                  AppText(AppStrings.website,
                      style: Styles.circularStdMedium(context,
                          fontSize: 16.sp, color: AppColors.blackColor)),
                  CustomTextFieldWithOnTap(
                      borderRadius: 40.r,
                      prefixIcon: SvgPicture.asset(Assets.profile),
                      controller: website,
                      hintText: 'www.website.com',
                      textInputType: TextInputType.name),
                ],
              ),
              20.y,
              CustomButton(
                onTap: () {},
                text: 'Publish profile',
                borderRadius: 25.sp,
              ),
              20.y,
            ],
          ),
        ),
      ),
    );
  }
}
