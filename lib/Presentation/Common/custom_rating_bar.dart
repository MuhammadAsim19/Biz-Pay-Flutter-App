import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class CustomRating extends StatelessWidget {
  const CustomRating(
      {this.initialRating,
      this.minRating = 1,
      this.iconSize = 20,
      this.iconsPaddingHorizontal = 12,
      this.icon = Icons.star,
      this.iconColor = Colors.amber,
      this.titleTextColor = AppColors.blackColor,
      this.titleText,
      required this.onRatingUpdate,
      Key? key})
      : super(key: key);
  final void Function(double) onRatingUpdate;
  final double? initialRating;
  final double minRating;
  final double iconSize;
  final double iconsPaddingHorizontal;
  final IconData icon;
  final Color iconColor;
  final Color? titleTextColor;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 8.0).r,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3).r,
                      child: AppText(
                        titleText!,
                        style: Styles.circularStdRegular(
                          context,
                          fontSize: 16.sp,
                          color: titleTextColor,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          RatingBar.builder(
            initialRating: initialRating ?? 0.0,
            minRating: minRating,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding:
                EdgeInsets.symmetric(horizontal: iconsPaddingHorizontal),
            itemBuilder: (context, _) => Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            onRatingUpdate: onRatingUpdate,
          ),
        ],
      ),
    );
  }
}
