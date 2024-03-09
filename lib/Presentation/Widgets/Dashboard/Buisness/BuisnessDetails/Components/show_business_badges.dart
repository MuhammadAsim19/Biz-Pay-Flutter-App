import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/view_business_budge.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText("${widget.badge?.badgeReff?.title}",
                style: Styles.circularStdMedium(context, fontSize: 18.sp)),
            20.x,
          ],
        ),
        centerTitle: true,
        leadingWidth: 48.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.sp),
          child: const BackArrowWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0).r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedImage(
                  radius: 25.sp,
                  isCircle: true,
                  url: "${ApiConstant.baseurl}${widget.badge?.badgeReff?.icon}",
                ),
                AppText("Price : \$ ${widget.badge?.badgeReff?.price}",
                    style: Styles.circularStdMedium(context, fontSize: 16.sp)),

                // NoteAndAttachmentWidget(
                //   attachmentTitle: widget.badge.,
                // ),
              ],
            ),
            const PaymentNotPayed(),
          ],
        ),
      ),
    );
  }
}

class PaymentNotPayed extends StatelessWidget {
  const PaymentNotPayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        70.y,
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
        CustomButton(horizontalMargin: 25.sp, onTap: () {}, text: "Buy Now")
      ],
    );
  }
}
