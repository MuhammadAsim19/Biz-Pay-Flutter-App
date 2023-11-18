import 'dart:io';

import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class PublishWidget extends StatefulWidget {
  const PublishWidget({super.key});

  @override
  State<PublishWidget> createState() => _PublishWidgetState();
}

class _PublishWidgetState extends State<PublishWidget> {
  var images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //  30.y,
          20.y,
          AppText('Upload image', style: Styles.circularStdMedium(context,fontSize: 20)),
          10.y,
          AddImageWidget(
            addText: "Uploads photos",
            onTap: () async {
              images = await PickFile.pickImage();
              setState(() {});
            },
          ),
          10.y,
AppText('At least 8 photos to improve check for sale', style: Styles.circularStdRegular(context,color: const Color(0xFFB0B0B0),fontSize: 14
)),
          AppText('Should be jpg, png, git format only', style: Styles.circularStdRegular(context,color: const Color(0xFFB0B0B0),fontSize: 14
          )),

          images != null
              ? SizedBox(
            height: 100.h,
            width: 1.sw,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return DisplayFileImage(
                  fileImage: images[index].toString(),
                  onDeleteTap: () {
                    setState(() {
                      images.removeAt(index);
                      //image = [];
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 5.sp,
                );
              },
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class AddImageWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? addText;

  const AddImageWidget({
    super.key,
    required this.onTap,
    this.addText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          color: AppColors.whiteColor,
          width: 1.sw,
          //  height: 110,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12).r,
            padding: const EdgeInsets.symmetric(vertical: 35).r,
            color: AppColors.greyColor,
            strokeWidth: 3,
            dashPattern: const [2, 3],
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.addImageIcon,height: 20,width: 20,),
                  CustomSizedBox.height(10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6).r,
                    child: AppText(
                     "Uploads photos",
                      style: Styles.circularStdRegular(
                        context,
                        fontSize: 15.sp,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PickFile {
  static Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowedExtensions: [".jpg",".png",".heic","jpeg"],
      allowMultiple: true,
    );
    if (result == null) return;
    final images = result.paths;
    return images;
  }

  static Future pickSingleImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowedExtensions: [".jpg",".png",".heic","jpeg"],
      allowMultiple: false,
    );
    if (result == null) return;
    String? images = result.paths[0];
    return images;
  }

  static Future<FilePickerResult?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
      // allowedExtensions: [
      //   'jpg',
      //   'png',
      //   'jpeg',
      //   'docx',
      //   'doc',
      //   'pdf',
      //   'csv',
      //   'xls',
      //   'xlsx',
      //   'txt',
      //   'mp4',
      // ],
    );
    if (result == null) return null;
    return result;
  }

  static Future<List<PlatformFile>?> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
      // allowedExtensions: [
      //   'jpg',
      //   'png',
      //   'jpeg',
      //   'docx',
      //   'doc',
      //   'pdf',
      //   'csv',
      //   'xls',
      //   'xlsx',
      //   'txt',
      //   'mp4',
      // ],
    );
    if (result == null) return null;
    return result.files;
  }

  static Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    return imageTemporary;
  }
}

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
              width: 100.w,
              height: 92.h,
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
          child:GestureDetector(

              onTap: onDeleteTap,
              child: SvgPicture.asset(Assets.crossDeleteIcon)),
        )
      ],
    );
  }
}