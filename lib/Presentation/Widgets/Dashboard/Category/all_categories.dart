import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Category/categroy.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/SearchListing/search_listing.dart';

class AllCategory extends StatelessWidget {
  AllCategory({super.key, this.categoryData});

  final List<Category>? categoryData;

  final List<Category> categoryFullData = [
    // CategoryDummy(
    //     catPic: Assets.foodBeverageIcon,
    //     catName: "Food & Beverage",
    //     backgroundColor: 0xFFEAF1FD),
    // CategoryDummy(
    //     catPic: Assets.fashionIcon,
    //     catName: "Fashion",
    //     backgroundColor: 0xFFEDF5ED),
    // CategoryDummy(
    //     catPic: Assets.retailIcon,
    //     catName: "Retail",
    //     backgroundColor: 0xFFFCEDE9),
    // CategoryDummy(
    //     catPic: Assets.serviceIcon,
    //     catName: "Service",
    //     backgroundColor: 0xFFF0F6F4),
    // CategoryDummy(
    //     catPic: Assets.educationIcon,
    //     catName: "Education",
    //     backgroundColor: 0xFFE5F2F9),
    // CategoryDummy(
    //     catPic: Assets.entertainmentIcon,
    //     catName: "Entertainment",
    //     backgroundColor: 0xFFFAF0EE),
    // CategoryDummy(
    //     catPic: Assets.agricultureIcon,
    //     catName: "Agriculture",
    //     backgroundColor: 0xFFE5F2E6),
    // CategoryDummy(
    //     catPic: Assets.informationTech,
    //     catName: "Travel",
    //     backgroundColor: 0xFFFEF3E8),
    // CategoryDummy(
    //     catPic: Assets.automotiveBoatIcon,
    //     catName: "Automotive & Boat",
    //     backgroundColor: 0xFFEDEDF5),
    // CategoryDummy(
    //     catPic: Assets.healthCareAndFitnessIcon,
    //     catName: "Health Care & Fitness",
    //     backgroundColor: 0xFFEBF8F7),
    // CategoryDummy(
    //     catPic: Assets.transportationIcon,
    //     catName: "Transportation & Storage",
    //     backgroundColor: 0xFFF2EBE5),
    Category(
        icon: Assets.manufactureIcon,
        title: "Manufacturing",
        backgroundcolor: '0xFFF3F9EC'),
    Category(
        icon: Assets.petServiceIcon,
        title: "Pet Services",
        backgroundcolor: "0xFFE8F5FC"),
    Category(
        icon: Assets.wholeSaleDistributorIcon,
        title: "Whole Sale & Distributor",
        backgroundcolor: "0xFFE6F6F6"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigate.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              Assets.arrowBackIcon,
              width: 10.sp,
              height: 10.sp,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        leadingWidth: 40.sp,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppText(
          'All Categories',
          style: Styles.circularStdRegular(context,
              fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          20.y,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 1.sw,
              child: GridView.builder(
                shrinkWrap: true,
                padding:
                    EdgeInsets.only(bottom: 10.sp, left: 5.sp, right: 5.sp),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 elements per row
                    crossAxisSpacing: 0.sp, // spacing between elements
                    mainAxisSpacing: 0.sp,
                    childAspectRatio: 0.8 // spacing between rows
                    ),
                itemCount: categoryData!.length,
                itemBuilder: (context, index) {
                  final category = categoryData![index];
                  final color = int.parse("0xff${category.backgroundcolor!}");
                  return GestureDetector(
                    onTap: () {
                      Navigate.to(
                          context,
                          SearchListing(
                              title: categoryData![index].title ?? "",
                              id: categoryData![index].id ?? ""));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(color),
                          child: Center(
                              child: SvgPicture.network(
                             "${ApiConstant.baseurl}/${category.icon}",
                          )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: AppText(
                            category.title!,
                            textAlign: TextAlign.center,
                            style: Styles.circularStdRegular(context,
                                fontSize: 14.sp),
                            maxLine: 3,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
