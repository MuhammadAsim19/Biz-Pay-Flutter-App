import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Brokers/broker_list_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/ChatModel/chat_tile_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/chat_details.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/home.dart';

class BrokerProfile extends StatefulWidget {
  BrokerProfile({super.key, this.model});

  BrokersListModel? model;

  @override
  State<BrokerProfile> createState() => _BrokerProfileState();
}

class _BrokerProfileState extends State<BrokerProfile> {
  ScrollController controller = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    print("${ApiConstant.baseUrl}/${widget.model!.userInfo!.profilePic}");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (context, check) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.33,
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
                                "${ApiConstant.baseUrl}/${widget.model!.userInfo!.profilePic}",
                            height: 108.h,
                            width: 120.w,
                          ),
                        ],
                      ),
                      12.y,
                      Align(
                        alignment: Alignment.center,
                        child: AppText(
                            "${widget.model!.firstName}${widget.model!.lastName}",
                            style: Styles.circularStdBold(context,
                                fontWeight: FontWeight.w500, fontSize: 21.sp)),
                      ),
                      4.y,
                      Align(
                        alignment: Alignment.center,
                        child: AppText(
                            widget.model!.experties!.profession ?? "",
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
                      AppText("${widget.model!.description}",
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
                      if (widget.model!.experties!.servicesOffered != null)
                        Wrap(
                          spacing: 20.sp,
                          runSpacing: 12.sp,
                          children: widget.model!.experties!.servicesOffered!
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
                      if (widget.model!.industriesServed != null)
                        Wrap(
                          spacing: 20.sp,
                          runSpacing: 12.sp,
                          children: widget.model!.industriesServed!.map((e) {
                            return BrokerChipWidget(
                              labelText: e.title,
                            );
                          }).toList(),
                        ),
                      30.y,
                      customRow(AppStrings.experice,
                          "${widget.model!.experties!.yearOfExperience} years"),
                      13.y,
                      AppText(AppStrings.certificate,
                          style: Styles.circularStdRegular(
                            context,
                            fontSize: 16.sp,
                            color: AppColors.blackColor,
                          )),
                      10.y,
                      if (widget.model?.certificates != null)
                        Wrap(
                          spacing: 20.sp,
                          runSpacing: 12.sp,
                          children: widget.model!.certificates!.map((e) {
                            return BrokerChipWidget(
                              labelText: e,
                            );
                          }).toList(),
                        ),
                      13.y,
                      // customRow(AppStrings.certificate,
                      //     widget.model!.certificates!.first),
                      30.y,
                      AppText(AppStrings.industry,
                          style: Styles.circularStdBold(
                            context,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: AppColors.blackColor,
                          )),
                      13.y,
                      AppText(widget.model!.website!,
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
                    text: 'Chat with ${widget.model!.firstName}',
                    borderRadius: 40.sp),
              ),
            ],
          ),
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
