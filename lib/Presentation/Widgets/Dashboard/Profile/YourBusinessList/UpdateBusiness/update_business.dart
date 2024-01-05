import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExpertProfile/Controller/get_all_country_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/UpdateBusiness/Components/update_business_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/UpdateBusiness/Components/price&medi.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/YourBusinessList/UpdateBusiness/Controller/update_business_notifer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBusiness extends StatefulWidget {
  const UpdateBusiness({super.key, this.model});

  final BusinessModel? model;

  @override
  State<UpdateBusiness> createState() => _UpdateBusinessState();
}

class _UpdateBusinessState extends State<UpdateBusiness> {
  @override
  void initState() {
    context.read<GetAllCountryCubit>().getCountry();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.model!.country);

    return PopScope(
      onPopInvoked: (didPop) {
        print(UpdateBusinessNotifier.updateBusiness.value);
        if (UpdateBusinessNotifier.updateBusiness.value == 0) {
          UpdateBusinessNotifier.addPageController.removeListener(() {});
        } else {
          UpdateBusinessNotifier.updateBusiness.value = 0;
          UpdateBusinessNotifier.addPageController.jumpToPage(0);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          elevation: 1,
          title: AppText(
            'Update Business',
            style: Styles.circularStdMedium(context, fontSize: 18),
          ),
          actions: [
            ValueListenableBuilder(
              builder: (context, state, ss) {
                return state == 0
                    ? IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.blackColor,
                        ),
                        onPressed: () {
                          // Handle icon tap event

                          Navigate.pop(context);
                        },
                      )
                    : const SizedBox();
              },
              valueListenable: UpdateBusinessNotifier.updateBusiness,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            children: [
              10.y,

              ///top Three Containers
              ValueListenableBuilder(
                builder: (context, pageState, ss) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // AddNotifier.addPageController.jumpToPage(1);
                          // AddNotifier.addBusinessNotifier.value = 1;
                        },
                        child: Container(
                          width: 42.sp,
                          height: 42.sp,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFD9D9D9)),
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 34.w,
                              height: 34.h,
                              decoration: ShapeDecoration(
                                color: Color(
                                    pageState == 0 ? 0xFF007BC0 : 0xFFD9D9D9),
                                shape: const CircleBorder(),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(Assets.tickIcon)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1.sw / 1.9,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // AddNotifier.addPageController.jumpToPage(2);
                          // AddNotifier.addBusinessNotifier.value = 2;
                        },
                        child: Container(
                          width: 42.sp,
                          height: 42.sp,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFD9D9D9)),
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 34.w,
                              height: 34.h,
                              decoration: ShapeDecoration(
                                color: Color(
                                    pageState == 1 ? 0xFF007BC0 : 0xFFD9D9D9),
                                shape: const CircleBorder(),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(Assets.tickIcon)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                valueListenable: UpdateBusinessNotifier.updateBusiness,
              ),
              2.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText('Business detail & Location',
                      style: Styles.circularStdRegular(context,
                          fontSize: 13, fontWeight: FontWeight.w500)),

                  const Spacer(),
                  // Container(
                  //   width: 1.sw/10,
                  //
                  // ),
                  AppText('Prices & Media',
                      style: Styles.circularStdRegular(context,
                          fontSize: 13, fontWeight: FontWeight.w500))
                ],
              )
              // Container(
              //   width: 34,
              //   height: 34,
              //   decoration: ShapeDecoration(
              //     color: Color(0xFF007BC0),
              //     shape: OvalBorder(),
              //   ),
              // )
              ,
              Expanded(
                  child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: UpdateBusinessNotifier.addPageController,
                children: [
                  UpdateBusinessDetails(businessModel: widget.model),
                  UpdatePriceLocation(businessModel: widget.model),
                  // UpdateWidget(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
