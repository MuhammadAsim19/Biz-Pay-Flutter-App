import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/Controller/Brokers/brokers_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrokerProfile extends StatefulWidget {
  const BrokerProfile({super.key, this.id});

  final String? id;

  @override
  State<BrokerProfile> createState() => _BrokerProfileState();
}

class _BrokerProfileState extends State<BrokerProfile> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    context.read<BrokersCubit>().getBrokers(brokerId: widget.id);
    // TODO: implement initState
    super.initState();
  }

  List serviceOffered = [
    'Business',
    'Business marketing',
    'Marketing',
    'Financing assistance',
    'Confidential business marketing'
  ];
  List industry = [
    'Automobile',
    'Education',
    'Construction',
    'Wholesale business',
    'Franchises'
  ];

  BrokersListModel? model;

  @override
  Widget build(BuildContext context) {
    print("this the id ${widget.id}");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<BrokersCubit, BrokersState>(
          listener: (context, state) {
            print("here is the state $state");

            if (state is BrokersLaoding) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is BrokersLoaded) {
              model = state.brokers![0];
              Navigator.of(context).pop(true);
            }
            if (state is BrokersError) {
              Navigator.pop(context);
              WidgetFunctions.instance
                  .showErrorSnackBar(context: context, error: state.error!);
            }
          },
          builder: (context, state) {
            return state is BrokersLoaded
                ? NestedScrollView(
                    controller: controller,
                    headerSliverBuilder: (context, check) {
                      return [
                        SliverAppBar(
                          pinned: true,
                          expandedHeight:
                              MediaQuery.of(context).size.height * 0.33,
                          automaticallyImplyLeading: false,
                          backgroundColor: AppColors.whiteColor,
                          flexibleSpace: SingleChildScrollView(
                            child: Column(
                              children: [
                                16.y,
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.sp,
                                  ),
                                  child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: BackArrowWidget()),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CachedImage(
                                      isCircle: true,
                                      url:
                                          "${ApiConstant.baseUrl}/${model?.userInfo!.profilePic}",
                                      height: 108.h,
                                      width: 120.w,
                                    ),
                                  ],
                                ),
                                12.y,
                                Align(
                                  alignment: Alignment.center,
                                  child: AppText(
                                      "${model?.firstName}${model?.lastName}",
                                      style: Styles.circularStdBold(context,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21.sp)),
                                ),
                                4.y,
                                Align(
                                  alignment: Alignment.center,
                                  child: AppText(
                                      model?.experties!.profession ?? "",
                                      style: Styles.circularStdRegular(context,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: AppColors.greyTextColor)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ];
                    },
                    body: Stack(
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                24.y,
                                // 20.y,
                                AppText("${model?.description}",
                                    maxLine: 9,
                                    style: Styles.circularStdRegular(
                                      context,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                      color: AppColors.greyTextColor,
                                    )),
                                23.y,
                                AppText(AppStrings.serviceOffered,
                                    style: Styles.circularStdBold(
                                      context,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                      color: AppColors.blackColor,
                                    )),
                                14.y,
                                if (model?.experties!.servicesOffered != null)
                                  Wrap(
                                    spacing: 20.sp,
                                    runSpacing: 12.sp,
                                    children: model!.experties!.servicesOffered!
                                        .map((e) {
                                      return BrokerChipWidget(
                                        labelText: e,
                                      );
                                    }).toList(),
                                  ),
                                30.y,
                                AppText(AppStrings.industry,
                                    style: Styles.circularStdBold(
                                      context,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                      color: AppColors.blackColor,
                                    )),
                                14.y,
                                if (model?.industriesServed != null)
                                  Wrap(
                                    spacing: 20.sp,
                                    runSpacing: 12.sp,
                                    children: model!.industriesServed!.map((e) {
                                      return BrokerChipWidget(
                                        labelText: e.title,
                                      );
                                    }).toList(),
                                  ),
                                30.y,
                                customRow(AppStrings.experice,
                                    "${model?.experties!.yearOfExperience} years"),
                                13.y,
                                AppText(AppStrings.certificate,
                                    style: Styles.circularStdRegular(
                                      context,
                                      fontSize: 16.sp,
                                      color: AppColors.blackColor,
                                    )),
                                10.y,
                                if (model?.certificates != null)
                                  Wrap(
                                    spacing: 20.sp,
                                    runSpacing: 12.sp,
                                    children: model!.certificates!.map((e) {
                                      return BrokerChipWidget(
                                        labelText: e,
                                      );
                                    }).toList(),
                                  ),
                                13.y,
                                // customRow(AppStrings.certificate,
                                //     model!.certificates!.first),
                                30.y,
                                AppText(AppStrings.industry,
                                    style: Styles.circularStdBold(
                                      context,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                      color: AppColors.blackColor,
                                    )),
                                13.y,
                                AppText(model?.website ?? "",
                                    style: Styles.circularStdRegular(
                                      context,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      color: AppColors.blackColor,
                                    )),
                                63.y,
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16.sp,
                          left: 10.sp,
                          right: 10.sp,
                          child: CustomButton(
                              width: 300.w,
                              height: 40.h,
                              onTap: () {
                                // Navigate.to(
                                //     context,
                                //     ChatDetailsScreen(
                                //       model: ChatTileModel(
                                //           message: 'Thank You',
                                //           messageLength: '1',
                                //           name: 'Gabriel Tasse',
                                //           pr0fileImage: 'assets/images/chat1.png',
                                //           time: '03:30 PM',
                                //           title: ';dlas;jdaskdj'),
                                //     ));
                              },
                              text: 'Chat with ${model?.firstName}',
                              borderRadius: 40.sp),
                        ),
                      ],
                    ),
                  )
                : state is BrokersError
                    ? Center(
                        child: AppText(
                          state.error!,
                          style: Styles.circularStdRegular(context),
                        ),
                      )
                    : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  customRow(String title, String subTitle) {
    return Row(
      children: [
        Container(
          width: 5.0,
          height: 5.0,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        ),
        15.x,
        AppText(title,
            style: Styles.circularStdRegular(
              context,
              fontSize: 16.sp,
              color: AppColors.blackColor,
            )),
        80.x,
        Expanded(
          child: AppText(subTitle,
              style: Styles.circularStdRegular(
                context,
                fontSize: 16.sp,
                color: AppColors.blackColor,
              )),
        ),
      ],
    );
  }
}

class BrokerChipWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? labelText;
  final Color? chipColor;
  final TextStyle? style;

  const BrokerChipWidget({
    super.key,
    this.height,
    this.width,
    this.labelText,
    this.chipColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30.sp,
      width: width,
      child: Chip(
        backgroundColor: AppColors.lightBlueColor,
        label: AppText(
          labelText ?? 'Chat',
          style: style ??
              Styles.circularStdRegular(context, color: AppColors.blackColor),
        ),
      ),
    );
  }
}
