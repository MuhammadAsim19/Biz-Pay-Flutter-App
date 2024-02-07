import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Category/categroy.dart';

class CategoryList extends StatelessWidget {
  final List<Category>? categoryData;

  final void Function(Category val, int index) getData;

  const CategoryList(
      {super.key, required this.categoryData, required this.getData});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 1.sw,
//height: 200,
      child: categoryData!.isNotEmpty
          ? GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 10.sp),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 elements per row
                  crossAxisSpacing: 0.sp, // spacing between elements
                  mainAxisSpacing: 0.sp,
                  childAspectRatio: 0.8 // spacing between rows
                  ),
              itemCount: categoryData!.length >= 8 ? 8 : categoryData!.length,
              itemBuilder: (context, index) {
                final category = categoryData![index];
                final color = int.parse("0xff${category.backgroundcolor!}");
                print("${ApiConstant.baseurl}${category.icon ?? ""}");
                return GestureDetector(
                  onTap: () {
                    getData(category, index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            index == 7 ? const Color(0xffD58750) : Color(color),
                        child: Center(
                            child: index == 7
                                ? SvgPicture.asset(
                                    Assets.moreIcon,
                                    width: 30.sp,
                                    height: 30.sp,
                                  )
                                : SvgPicture.network(

                                        "${ApiConstant.baseurl}${category.icon ?? ""}",

                                  )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: AppText(
                          index == 7 ? "Show More" : category.title!,
                          textAlign: TextAlign.center,
                          style: Styles.circularStdRegular(context,
                              fontSize: 13.sp),
                          maxLine: 2,
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : Center(
              child: AppText(
                'Data Not Found',
                style: Styles.circularStdRegular(context),
              ),
            ),

      ///wrap
//       child: Wrap(
//        spacing:15.sp,
//         runSpacing: 10.sp,
//         alignment: WrapAlignment.center,
//
//         runAlignment: WrapAlignment.start,
//         crossAxisAlignment: WrapCrossAlignment.center,
//         children: categoryData.map((e) {
//
//           return GestureDetector(
//             onTap: ()
//             {
//               getData(e);
//
//
//             },
//             child: SizedBox
//               (
// //color: Colors.amber,
//               width: 60.w,
//               //height: 108.h,
//               child: Column(
//                 children: [
//                   // AssetImageWidget(url: e.catPic.toString(),isCircle: true,radius: 30,color: Color(e.backgroundColor!),),
//
//                   CircleAvatar(
//                       radius: 30,
//                       backgroundColor: Color(e.backgroundColor!),
//                       child: Center(child: SvgPicture.asset(e.catPic!),),
//
//
//                   ),
//                   SizedBox(
//                       //height: 5,
//                       //width:64.w,
//
//                       child: Center(child: AppText(e.catName.toString(), style: Styles.circularStdRegular(context,fontSize: 10.sp),maxLine:3,)))
//
//
//                 ],
//               ),
//             ),
//           );
//
//         } ).toList(),
//
//
//
//       ),
    );
  }
}
