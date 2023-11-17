import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Category/categroy_dummy.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Components/Category/categories_list.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/SearchListing/search_listing.dart';

class AllCategory extends StatelessWidget {
   AllCategory({super.key});
 final List<CategoryDummy> categoryFullData=[

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


appBar: AppBar(leading: GestureDetector(

  onTap: (){
    Navigate.pop(context);
  },
  child:   Container(
    margin: const EdgeInsets.only(left: 10),
    child:   SvgPicture.asset(Assets.arrowBackIcon,width: 10.sp,height:
      10.sp,
      fit: BoxFit.fitWidth
      ,

    ),
  ),
),leadingWidth: 40.sp,
  elevation: 0,
  automaticallyImplyLeading: false,
  title: AppText('All Categories', style: Styles.circularStdRegular(context,fontWeight: FontWeight.w700,fontSize:
  18.sp),),

centerTitle: true,
  backgroundColor: AppColors.whiteColor,
),


body: Column(
 // crossAxisAlignment: CrossAxisAlignment.center,


  children: [
    20.y,

  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: CategoryList(categoryData: categoryFullData, getData: (CategoryDummy val) {

      Navigate.to(context, SearchListing(title: val.catName!));


    },),
  )

],),
    );
  }
}
