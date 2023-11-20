import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_radio_button.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/widget_functions.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
import 'package:dotted_border/dotted_border.dart';

class BusinessAddDetails extends StatelessWidget {
   BusinessAddDetails({super.key});
TextEditingController businessNameController=TextEditingController();

   TextEditingController industryController=TextEditingController();

   TextEditingController yearFoundController=TextEditingController();
   TextEditingController ofOwnerController=TextEditingController();
   TextEditingController ofEmployeeController=TextEditingController();
   TextEditingController descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:       CustomButton(onTap: () {

        AddNotifier.addPageController.jumpToPage(1);
        AddNotifier.addBusinessNotifier.value=1;

      },
        textFontWeight: FontWeight.w500,
        borderRadius: 30,
        height: 56,
        text: 'Next' ,),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.y,
            AppText("Business  Detail", style: Styles.circularStdMedium(context,fontSize: 20)),

            Form(child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomTextFieldWithOnTap(controller: businessNameController, hintText: 'Business Name',

                    borderRadius: 40,


                   // isBorderRequired: false,
                    textInputType: TextInputType.text),
///industry dropDown
                Container(width: 380,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.3, color: AppColors.lightGreyColor,),

                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: GeneralizedDropDown(
                    height: 100,
                      width: 100,
                      isFit: true,
                      icon: SvgPicture.asset(Assets.dropDownIcon),
                      style: Styles.circularStdRegular(context,fontSize: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      //isBorder: true,
                      items: const ["IndustryA","IndustryB"], selectedValue: "IndustryB", onChanged: (onChanged){
                      industryController.text=onChanged.toString();

                  }),
                ),
                10.y,
                /// year found drop down
                Container(width: 380,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.3, color: AppColors.lightGreyColor,),

                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: GeneralizedDropDown(
                      height: 100,
                      width: 100,
                      isFit: true,
                      icon: SvgPicture.asset(Assets.dropDownIcon),
                      hint: "Years Found",

                      style: Styles.circularStdRegular(context,fontSize: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      //isBorder: true,
                      items: const ["1990","2000","2004"], selectedValue: null, onChanged: (onChanged){
                    yearFoundController.text=onChanged.toString();

                  }),
                ),
                10.y,
                /// owner drop down
                Container(width: 380,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.3, color: AppColors.lightGreyColor,),

                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: GeneralizedDropDown(
                      height: 100,
                      width: 100,
                      isFit: true,
                      icon: SvgPicture.asset(Assets.dropDownIcon),
                      hint: "# of owner",

                      style: Styles.circularStdRegular(context,fontSize: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      //isBorder: true,
                      items: const ["dummy owner","dummy 2","dummy 3"], selectedValue: null, onChanged: (onChanged){
                    ofOwnerController.text=onChanged.toString();

                  }),
                ),

                10.y,
                /// employee drop down
                Container(width: 380,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.3, color: AppColors.lightGreyColor,),

                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: GeneralizedDropDown(
                      height: 100,
                      width: 100,
                      isFit: true,
                      icon: SvgPicture.asset(Assets.dropDownIcon),
                      hint: "# of employee",

                      style: Styles.circularStdRegular(context,fontSize: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      //isBorder: true,
                      items: const ["dummy employee","dummy 2","dummy 3"], selectedValue: null, onChanged: (onChanged){
                    ofEmployeeController.text=onChanged.toString();

                  }),
                ),

                10.y,
                /// description text
                ///
                CustomTextFieldWithOnTap(controller: descriptionController, hintText: 'Description',

                    borderRadius: 40,
                    height: 200.h,
                    maxline: 10,


                    // isBorderRequired: false,
                    textInputType: TextInputType.text),

                AppText("Business  Hour", style: Styles.circularStdMedium(context,fontSize: 20)),

                CustomTextFieldWithOnTap(controller: descriptionController, hintText: 'Time to run business (hour per week)',

                    borderRadius: 40,
                    height: 200.h,



                    // isBorderRequired: false,
                    textInputType: TextInputType.text),
                AppText("Advantages", style: Styles.circularStdMedium(context,fontSize: 20)),


               // CheckboxWithText(text: 'test', value: false, onChanged: (bool? value) {  },)

              ],

            )),
            Wrap(
              spacing: 0,
              // Add spacing between the checkbox widgets

              children: [
                SizedBox(
                  width: 150,
                  child: CheckboxWithText(
                    text: 'Building Property',
                    value: true,
                    onChanged: (bool? value) {

                    },
                  ),
                ),
                SizedBox(
                  width: 140 ,
                  child: CheckboxWithText(
                    text: 'Equipment',
                    value: false,
                    onChanged: (bool? value) {

                    },
                  ),
                ),
                SizedBox(
                  width: 140 ,
                  child: CheckboxWithText(
                    text: 'Contracts',
                    value: false,
                    onChanged: (bool? value) {

                    },
                  ),
                ),
                SizedBox(
                  width: 140 ,
                  child: CheckboxWithText(
                    text: 'Assets',
                    value: true
                    ,
                    onChanged: (bool? value) {

                    },
                  ),
                ),
              ],
            ),

            AppText("Documents", style: Styles.circularStdMedium(context,fontSize: 20)),
            CustomTextFieldWithOnTap(controller: descriptionController, hintText: 'Business registration number',

                borderRadius: 40,
                height: 200.h,



                // isBorderRequired: false,
                textInputType: TextInputType.text),

ClipRRect(

  borderRadius: const BorderRadius.all(Radius.circular(12)),
  child:   Container(
    color: AppColors.dottedGreyColor,
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12).r,
      padding: const EdgeInsets.symmetric(vertical: 35).r,
      color: AppColors.greyColor,

      strokeWidth: 3,

      dashPattern: const [2, 3],
      child:   GestureDetector(
        onTap: ()
        async {
        var pickedFile= await PickFile.pickFiles();
        if(pickedFile!= null) {
          print(pickedFile[0].name);
        }
        },
        child: Container(
          height: 62,
          width: 123,
          decoration: const BoxDecoration(
           // color: Colors.red

          ),//color: AppColors.lightGreyColor),

    child: SizedBox(
        width: 97,
        height: 40,
        child: Column(

          children: [

            SvgPicture.asset(Assets.addImageIcon),

            AppText("Upload Document", style: Styles.circularStdRegular(context,fontSize: 12))

          ],


        ),
    )
        ),
      ),
    ),
  ),
),
            10.y


          ],
        ),
      ),
    );
  }
}
class CheckboxWithText extends StatelessWidget {
  final String text;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CheckboxWithText({
    Key? key,
    required

    this.text,
    required

    this.value,
    required

    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          //checkColor: AppColors.primaryColor,

          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
