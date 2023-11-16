import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Category/categroy_dummy.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryDummy> categoryData;

  final void Function(CategoryDummy val) getData;

  const CategoryList({super.key, required this.categoryData,required this.getData});

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing:20.sp,
      runSpacing: 12.sp,
      children: categoryData.map((e) {

        return GestureDetector(
          onTap: ()
          {
            getData(e);


          },
          child: Column(
            children: [
              // AssetImageWidget(url: e.catPic.toString(),isCircle: true,radius: 30,color: Color(e.backgroundColor!),),

              CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(e.backgroundColor!),
                  child: Center(child: SvgPicture.asset(e.catPic!),),


              ),
              SizedBox(
                  height: 30,
                  width:50,

                  child: Center(child: AppText(e.catName.toString(), style: Styles.circularStdRegular(context,fontSize: 11.sp),maxLine:3,)))


            ],
          ),
        );

      } ).toList(),



    );
  }
}
