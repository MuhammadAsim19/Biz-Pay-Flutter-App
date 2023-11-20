import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisness_profile.dart';
import 'package:buysellbiz/Domain/Category/categroy_dummy.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/widget_functions.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BrokerProfile/broker_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Category/all_categories.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/BusinessBroker/Profile/business_profile_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/Category/categories_list.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/for_you_buisiness.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_added.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/recently_view.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Notifications/notifications.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/SearchListing/search_listing.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
TextEditingController searchController = TextEditingController();

List<String> countryList=['USA','China','PAK'];
String? selectedListItem;

List<CategoryDummy> categoryData=[

  CategoryDummy(catPic: Assets.foodBeverageIcon,catName: "Food & Beverage",backgroundColor: 0xFFEAF1FD),
  CategoryDummy(catPic: Assets.fashionIcon,catName: "Fashion",backgroundColor: 0xFFEDF5ED),
  CategoryDummy(catPic: Assets.retailIcon,catName: "Retail",backgroundColor: 0xFFFCEDE9),
  CategoryDummy(catPic: Assets.serviceIcon,catName: "Service",backgroundColor: 0xFFF0F6F4),
  CategoryDummy(catPic: Assets.educationIcon,catName: "Education",backgroundColor: 0xFFE5F2F9),
  CategoryDummy(catPic: Assets.entertainmentIcon,catName: "Entertainment",backgroundColor: 0xFFFAF0EE),
  CategoryDummy(catPic: Assets.informationTech,catName: "Information Technology",backgroundColor: 0xFFFBF3ED),
  CategoryDummy(catPic: Assets.moreIcon,catName: "More",backgroundColor: 0xFFFEF3E8)

];
List<CategoryDummy> categoryFullData=[

  CategoryDummy(catPic: Assets.foodBeverageIcon,catName: "Food & Beverage",backgroundColor: 0xFFEAF1FD),
  CategoryDummy(catPic: Assets.fashionIcon,catName: "Fashion",backgroundColor: 0xFFEDF5ED),
  CategoryDummy(catPic: Assets.retailIcon,catName: "Retail",backgroundColor: 0xFFFCEDE9),
  CategoryDummy(catPic: Assets.serviceIcon,catName: "Service",backgroundColor: 0xFFF0F6F4),
  CategoryDummy(catPic: Assets.educationIcon,catName: "Education",backgroundColor: 0xFFE5F2F9),
  CategoryDummy(catPic: Assets.entertainmentIcon,catName: "Entertainment",backgroundColor: 0xFFFAF0EE),
  CategoryDummy(catPic: Assets.agricultureIcon,catName: "Agriculture",backgroundColor: 0xFFE5F2E6),
  CategoryDummy(catPic: Assets.informationTech,catName: "Travel",backgroundColor: 0xFFFEF3E8),
  CategoryDummy(catPic: Assets.automotiveBoatIcon,catName: "Automotive\n& Boat",backgroundColor: 0xFFEDEDF5),
  CategoryDummy(catPic: Assets.healthCareAndFitnessIcon,catName: "Health Care & Fitness",backgroundColor: 0xFFEBF8F7),
  CategoryDummy(catPic: Assets.transportationIcon,catName: "Transportation\n& Storage",backgroundColor: 0xFFF2EBE5),
  CategoryDummy(catPic: Assets.manufactureIcon,catName: "Manufacturing",backgroundColor: 0xFFF3F9EC),
  CategoryDummy(catPic: Assets.petServiceIcon,catName: "Pet Services",backgroundColor: 0xFFE8F5FC),
  CategoryDummy(catPic: Assets.wholeSaleDistributorIcon,catName: "Whole Sale & Distributor",backgroundColor: 0xFFE6F6F6),


];


List<BusinessProductModel>  businessProducts =[
  BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 40K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 30K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 20K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage,businessName: 'Drop shipping website & E-commerce business',price: 'USD 10K',location: "San Francisco, USA"),

];
List<BusinessProductModel>  businessProducts1 =[
  BusinessProductModel(businessImage: Assets.dummyImage2,businessName: 'Drop shipping website & E-commerce business',
      isFav:false,
      price: 'USD 40K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',price: 'USD 30K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: true,
      businessName:

  'Drop shipping website & E-commerce business',price: 'USD 20K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: false,
      businessName: 'Drop shipping website & E-commerce business',price: 'USD 10K',location: "San Francisco, USA"),

];



///to be continued
List<BusinessBrokerProfile> profileData =[

  BusinessBrokerProfile(name: "Gabriel Tasse",image: Assets.dummyImage3
  ,businessCategories: ["Business","Franchises"],rating :5),
  BusinessBrokerProfile(name: "Gabriel Tasse",image: Assets.dummyImage3
      ,businessCategories: ["Business","Franchises","Businesss plus","testting"],rating:
  5),


];

List<BusinessProductModel>  businessProductsForYou =[
  BusinessProductModel(businessImage: Assets.dummyImage4,businessName: 'Famous tutoring franchise',
      isFav:false,
      price: 'USD 40K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',price: 'USD 30K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: true,
      businessName:

      'Drop shipping website & E-commerce business',price: 'USD 20K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: false,
      businessName: 'Drop shipping website & E-commerce business',price: 'USD 10K',location: "San Francisco, USA"),

];
List<BusinessProductModel>  businessProductsOnline =[
  BusinessProductModel(businessImage: Assets.dummyImage5,businessName: 'Web design & Digital marketing company',
      isFav:false,
      price: 'USD 40K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: true,
      businessName: 'Drop shipping website & E-commerce business',price: 'USD 30K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: true,
      businessName:

      'Drop shipping website & E-commerce business',price: 'USD 20K',location: "San Francisco, USA"),
  BusinessProductModel(businessImage: Assets.dummyImage2,
      isFav: false,
      businessName: 'Drop shipping website & E-commerce business',price: 'USD 10K',location: "San Francisco, USA"),

];
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Column(

  children: [

    ///Upper Container with Search Bar
SizedBox(
height: 200.h,
 // color: Colors.red,
  child:   Stack(
    children: [
      Container(
       // width: 428,
        height: 165.h,
        decoration: const BoxDecoration(color: AppColors.primaryColor),

        child: Row(
crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Container(
              margin: EdgeInsets.only(left: 24.sp),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                AppText(AppStrings.hello, style: Styles.circularStdRegular(context,fontSize: 14,color: AppColors.whiteColor)),
                AppText('Aqib Javid', style: Styles.circularStdMedium(context,fontSize: 20,color: AppColors.whiteColor))


              ],),
            ),
            const Spacer(),
            GestureDetector(
              onTap: ()
              {
                Navigate.to(context, Notifications());
              },
              child: Container(

                  margin: EdgeInsets.only(right: 23.sp),
                  child: SvgPicture.asset(Assets.notificationIcon)),
            )

          ],

        ),

      ),
      Positioned(
          //top: 0,
          left: 24,
          right: 24,
          bottom: 0,

          child: CustomTextFieldWithOnTap(controller: searchController,
borderRadius: 24,
            isBorderRequired: false,
            isShadowRequired: true,
            prefixIcon: SvgPicture.asset(Assets.searchIcon),
            suffixIcon: Container(
              margin: const EdgeInsets.only(
                right: 2
              ),
              child: GeneralizedDropDown(items: countryList, selectedValue: countryList[0], onChanged: (v){}
              ,


              ),
            )
,
            hintText: 'Search for business', textInputType: TextInputType.text,))
    ],
  ),
)
,

    ///
   10.y,
Expanded(
  child:   SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Container(
        margin:
      EdgeInsets.symmetric(horizontal: 24.sp),
      child: Align(
        alignment: Alignment.centerLeft,
      child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start
        ,
        children: [
          ///Category
            5.y,
          AppText("Categories", style: Styles.circularStdMedium(context,fontSize: 20)),
  10.y,
  CategoryList(categoryData: categoryData, getData: (CategoryDummy val) {



  if(val.catName?.trim()=="More")
      {
        print(val.catName);
        Navigate.to(context, AllCategory());
      }
  else{
    Navigate.to(context, SearchListing(title: val.catName!));
  }

  },)
  ///recently view
          ///
          ,
          19.y,
          AppText("Recently View", style: Styles.circularStdMedium(context,fontSize: 20)),
  5.y,
  RecentlyViewWidget(businessProducts: businessProducts, getData: (dto)
  {}),

          ///Recently Added
          19.y,
          Row(
            children: [
              AppText("Recently Added", style: Styles.circularStdMedium(context,fontSize: 20)),
              const Spacer(),

              AppText("View all", style: Styles.circularStdRegular(context,fontSize: 14))
            ],
          ),
          5.y,
          RecentlyAdded(businessProducts: businessProducts1, getData: (v)
          {}, chatTap: (BusinessProductModel val) { print(val.businessName); },),

          ///  Business Broker
          19.y,
          Row(
            children: [
              AppText("Business Broker", style: Styles.circularStdMedium(context,fontSize: 20)),
              const Spacer(),

              AppText("View all", style: Styles.circularStdRegular(context,fontSize: 14))
            ],
          ),
          5.y,
SizedBox(
  height: 257.h, 
  //width: 1.sw,
  child: ListView(
    //mainAxisSize: MainAxisSize.min,
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
   // shrinkWrap: true,
    children: [

    Container(
      width: 181.w,
      height: 257,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0,bottom: 0,top: 30),
          child: AppText("Share\nYour\nExpertise", style: Styles.circularStdRegular(context,color: AppColors.whiteColor,fontSize: 20,fontWeight:
          FontWeight.w500,letterSpacing: 0.4,),maxLine: 6,),
        ),
          const Spacer(),
          Align(
            child: CustomButton(onTap: (){}, text: 'Create Your Profile',
              textFontWeight: FontWeight.w400,
              horizontalMargin: 10,
              height: 45.sp,
              verticalMargin: 10,
             // verticalPadding: 13,
              textSize: 12,
              bgColor: AppColors.whiteColor,textColor: AppColors.primaryColor,borderRadius: 30.sp,),
          ),
          10.y

      ],),
    ),
10.x,
  BusinessProfileWidget(profileData: profileData, getData: (BusinessBrokerProfile val) {
    //print(val.rating);
    Navigate.to(context, const BrokerProfile());

  },)


  ],),
),
          /// Business For  You
          19.y,
          Row(
            children: [
              AppText("Business For You", style: Styles.circularStdMedium(context,fontSize: 20)),
              const Spacer(),

              AppText("View all", style: Styles.circularStdRegular(context,fontSize: 14))
            ],
          ),
          5.y,
          BusinessForYouWidget(businessProducts: businessProductsForYou, getData: (data){})
/// online Business
          ,19.y,
          Row(
            children: [
              AppText("Online Business", style: Styles.circularStdMedium(context,fontSize: 20)),
              const Spacer(),

              AppText("View all", style: Styles.circularStdRegular(context,fontSize: 14))
            ],
          ),
          5.y,
          BusinessForYouWidget(businessProducts: businessProductsOnline, getData: (data){})

        ],

      ),
    ),
    ),
  ),
)




  ],

),


    );
  }
}
