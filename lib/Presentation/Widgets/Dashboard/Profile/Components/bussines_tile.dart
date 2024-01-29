import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_popup_menu.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/ListBusiness/your_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/DeleteBusiness/Controller/delete_business_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/UpdateBusiness/update_business.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessList extends StatelessWidget {
  final List<BusinessModel>? businessProducts;
  final void Function(BusinessModel val) getData;
  final int? index;
  final bool isFromAllBusiness;

  const BusinessList(
      {super.key,
      required this.businessProducts,
      required this.getData,
      required this.isFromAllBusiness,
      this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteBusinessCubit, DeleteBusinessState>(
      listener: (context, state) {
        if (state is DeleteBusinessLoading) {
          LoadingDialog.showLoadingDialog(context);
        }
        if (state is DeleteBusinessLoaded) {
          Navigator.pop(context);
          WidgetFunctions.instance.snackBar(context, text: 'Delete SuccessFul');
          context.read<YourBusinessCubit>().getBusinessList();
        }
        if (state is DeleteBusinessError) {
          Navigator.pop(context);
          WidgetFunctions.instance.snackBar(context, text: state.error);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: 110.h,
          child: GestureDetector(
            onTap: () {
              getData(businessProducts![index!]);
            },
            child: Container(
              width: 338.sp,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFEEF1F6)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (businessProducts![index!].images != null)
                    CachedImage(
                      radius: 30.sp,
                      containerRadius: 10.sp,
                      isCircle: false,
                      url:
                          "${ApiConstant.baseUrl}/${businessProducts![index!].images!.first}",
                      width: 119.sp,
                      height: 120.h,
                    ),
                  10.x,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppText(businessProducts![index!].address!,
                                style: Styles.circularStdRegular(context,
                                    color: AppColors.lightGreyColor)),
                            const Spacer(),
                            CustomPopupMenu(
                              onClick: (action) {
                                print(action);

                                if (action == 'edit') {
                                  Navigate.to(
                                      context,
                                      UpdateBusiness(
                                        model: businessProducts![index!],
                                      ));
                                } else if (action == 'delete') {
                                  context
                                      .read<DeleteBusinessCubit>()
                                      .deleteBusiness(
                                          businessId:
                                              businessProducts![index!].id);
                                }
                              },
                            ),
                          ],
                        ),
                        5.y,
                        AppText(
                          businessProducts![index!].name!,
                          style: Styles.circularStdRegular(context,
                              fontSize: 17.sp),
                          maxLine: 3,
                        ),
                        5.y,
                        Row(
                          children: [
                            AppText(
                                "\$ ${businessProducts![index!].salePrice!}",
                                style: Styles.circularStdBold(context)),
                            const Spacer(),
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: SvgPicture.asset(Assets.show),
                            ),
                            5.x,
                            AppText(
                                businessProducts![index!].viewsCount.toString(),
                                style: Styles.circularStdMedium(context,
                                    fontSize: 12.sp)),
                            10.x,
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// enum MenuItem1 {
//   edit,
//   delete,
//   share,
// }
