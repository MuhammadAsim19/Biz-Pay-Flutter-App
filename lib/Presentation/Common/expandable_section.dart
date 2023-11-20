import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget expendedContent;
  final bool? isImageRequired;
  const ExpandableSection(
      {Key? key,
      required this.title,
      required this.expendedContent,
      this.isImageRequired})
      : super(key: key);

  @override
  State<ExpandableSection> createState() => _ExpandableState();
}

class _ExpandableState extends State<ExpandableSection> {
  bool isExpanded = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // padding: EdgeInsets.symmetric(vertical: 5.h),
        width: 1.sw,
        // margin: EdgeInsets.symmetric(horizontal: 20),
        // height: !isExpanded ? 50.h:null,
        decoration: BoxDecoration(
            color: isExpanded ? const Color(0xffE7EDF5) : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 12,
                offset: Offset(0, 6),
                spreadRadius: 0,
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: widget.isImageRequired != null
                          ? EdgeInsets.only(left: 5.sp)
                          : EdgeInsets.only(left: 20.sp),
                      child: Row(
                        children: [
                          widget.isImageRequired != null
                              ? AssetImageWidget(
                                  url: Assets.appLogo,
                                  color: AppColors.primaryColor,
                                  width: 50.w,
                                  height: 50.h,
                                )
                              : const SizedBox(),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                widget.title,
                                style: isExpanded
                                    ? Styles.circularStdBold(context,
                                        fontSize: 15.sp)
                                    : Styles.circularStdRegular(context,
                                        fontSize: 16.sp),
                                maxLine: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // Future.delayed(Duration(seconds: 2));
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      icon: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.primaryColor,
                      )),
                ],
              ),
              CustomSizedBox.height(10.h),
              if (isExpanded) ...[
                // Additional content when expanded
                // You can add more widgets here
                widget.expendedContent,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
