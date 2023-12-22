import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';

class MultiItemPicker extends StatefulWidget {
  final void Function(List<String>) onChange;
  final List getList;
  final String hintText;
  final double? hMar;
  final String validationText;

  const MultiItemPicker({
    super.key,
    required this.onChange,
    required this.getList,
    required this.hintText,
    required this.validationText,
    this.hMar = 10,
  });

  @override
  State<MultiItemPicker> createState() => _MultiItemPickerState();
}

class _MultiItemPickerState extends State<MultiItemPicker> {
  List<String> list = [];
  bool isClicked = false;

  var value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropDownWidget(
          isBorderRequired: true,
          hMargin: 0,
          vMargin: 0,
          itemsMap: widget.getList.map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
          hintText: widget.hintText,
          value: value,
          validationText: widget.validationText,
          onChanged: (value) {
            list.contains(value) ? null : list.add(value);
            widget.onChange(list);
            // value = list;
            setState(() {});
          },
        ),
        5.y,
        list.isNotEmpty
            ? Container(
                height: 30.h,
                margin: const EdgeInsets.symmetric(vertical: 8).r,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10).r,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => 10.x,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 2.sp),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20).r,
                          ),
                          child: Center(
                            child: AppText(
                              list[index],
                              style: Styles.circularStdRegular(
                                context,
                                color: list.contains(list[index])
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                list.removeAt(index);
                              });
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              width: 18.w,
                              height: 15.w,
                              decoration: const BoxDecoration(
                                color: AppColors.blackColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.close_rounded,
                                  color: AppColors.whiteColor,
                                  size: 10.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
