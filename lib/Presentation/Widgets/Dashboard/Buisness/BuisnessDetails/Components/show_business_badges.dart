import 'dart:developer';

import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/pay_for_business_badge.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/view_business_budge.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/pay_for_business_badge_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/State/view_business_badge_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/Common/note_attachment_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBusinessBadge extends StatefulWidget {
  const ShowBusinessBadge({super.key, this.badge});

  final BusinessBadge? badge;

  @override
  State<ShowBusinessBadge> createState() => _ShowBusinessBadgeState();
}

class _ShowBusinessBadgeState extends State<ShowBusinessBadge> {
  @override
  void initState() {
    context.read<ViewBusinessBadges>().getBadgeData(badgeId: widget.badge!.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("${widget.badge!.toJson()}");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     AppText("${widget.badge?.badgeReff?.title}",
        //         style: Styles.circularStdMedium(context, fontSize: 18.sp)),
        //     20.x,
        //   ],
        // ),
        centerTitle: true,
        leadingWidth: 48.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.sp),
          child: const BackArrowWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0).r,
        child: BlocConsumer<ViewBusinessBadges, ViewBusinessBadgeState>(
          listener: (context, state) {
            if (state is ViewBusinessBadgeLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is ViewBusinessBadgeLoaded) {
              Navigator.of(context).pop(true);
            }
            if (state is ViewBusinessBadgeError) {
              Navigator.pop(context);
              WidgetFunctions.instance.snackBar(context, text: state.error);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return state is ViewBusinessBadgeLoaded
                ? Column(
                    children: [
                      CachedImage(
                        radius: 30.sp,
                        isCircle: true,
                        url:
                            "${ApiConstant.baseurl}${widget.badge?.badgeReff?.icon}",
                      ),
                      10.y,
                      AppText("${widget.badge?.badgeReff?.title}",
                          style: Styles.circularStdMedium(context,
                              fontSize: 18.sp)),
                      20.y,
                      state.isPaid == false
                          ? PaymentNotPayed(
                              badgeId: widget.badge!.id,
                            )
                          : NoteAndAttachmentWidget(
                              noteTitle: 'Expert Note:',
                              attachmentTitle: 'Expert Report:',
                              attachment: state.attachemt,
                              note: state.note ?? ""),
                    ],
                  )
                : state is ViewBusinessBadgeError
                    ? Center(
                        child: AppText(state.error!,
                            style: Styles.circularStdMedium(context)),
                      )
                    : const SizedBox();
          },
        ),
      ),
    );
  }
}

class PaymentNotPayed extends StatelessWidget {
  final String? badgeId;

  const PaymentNotPayed({super.key, this.badgeId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.y,
        SizedBox(
            height: 250.sp,
            width: 200.sp,
            child: SvgPicture.asset(
              "assets/images/pay.svg",
              fit: BoxFit.cover,
            )),
        10.y,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppText("You have to buy first to see this badge details",
              textAlign: TextAlign.center,
              maxLine: 3,
              style: Styles.circularStdMedium(context, fontSize: 14.sp)),
        ),
        30.y,
        BlocListener<PayForBusinessBadge, PayForBusinessBadgeState>(
          listener: (context, state) {
            if (state is PayForBusinessBadgeStateLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is PayForBusinessBadgeStateLoaded) {
              context.read<ViewBusinessBadges>().getBadgeData(badgeId: badgeId);
              Navigator.of(context).pop(true);
            }
            if (state is PayForBusinessBadgeStateError) {
              Navigator.of(context).pop(true);
              WidgetFunctions.instance.snackBar(context, text: state.error);
            }
            // TODO: implement listener
          },
          child: CustomButton(
              horizontalMargin: 25.sp,
              onTap: () {
                context
                    .read<PayForBusinessBadge>()
                    .requestBagdeView(badgeId: badgeId!, context: context);
              },
              text: "Pay Now \$ 9.99"),
        )
      ],
    );
  }
}
