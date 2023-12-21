import 'dart:io';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:file_picker/file_picker.dart';

class DisplayFileImage extends StatelessWidget {
  final String fileImage;
  final VoidCallback onDeleteTap;

  // final  int index;

  const DisplayFileImage({
    super.key,
    required this.fileImage,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            // border: Border.all(
            //   color: AppColors.primaryColor,
            // ),
          ),
          child: Center(
            child: SizedBox(
              width: 96.w,
              height: 95.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(fileImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 1,
          child: GestureDetector(
              onTap: onDeleteTap,
              child: SvgPicture.asset(Assets.crossDeleteIcon)),
        )
      ],
    );
  }
}

class DisplayFile extends StatelessWidget {
  final PlatformFile? file;
  final VoidCallback onDeleteTap;

  const DisplayFile({
    super.key,
    required this.file,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15).r,
      margin: const EdgeInsets.symmetric(vertical: 8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppText(
              file?.name ?? "",
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.circularStdRegular(context),
            ),
          ),
          GestureDetector(
            onTap: onDeleteTap,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.delete,
              color: AppColors.redColor,
              size: 23.r,
            ),
          ),
        ],
      ),
    );
  }
}
