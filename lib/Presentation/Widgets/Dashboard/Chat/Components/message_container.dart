


import 'dart:async';
import 'dart:io';

import 'package:buysellbiz/Application/Services/Downloader/DioDownloads/downloaderDio.dart';
import 'package:buysellbiz/Application/Services/Downloader/file_downloader.dart';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_permision.dart';
import 'package:buysellbiz/Data/DataSource/Resources/api_constants.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/image_preview.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Components/video_preiveie.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inbox_detail_model.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/inboxmodel.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'ChatModel/chat_message_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;
import 'package:cached_network_image/cached_network_image.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key, this.modelData,  this.chatDto, this.senderId, this.index});

  final ChatMessageModel? modelData;
  final  Message? chatDto;
  final String? senderId;
  final int? index;
  static ValueNotifier<Map<int,String>> savedPath=ValueNotifier({});

  @override
  Widget build(BuildContext context) {
   // print("http://192.168.1.17:9000${chatDto!.images![0]}");
    return SingleChildScrollView(
      child: Align(
        alignment: chatDto!.sender == senderId
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
         // height: 1.sh/5,
          width: 260,
          margin: EdgeInsets.only(top: 10.sp),
          color:  chatDto!.images!.isNotEmpty?

               AppColors.borderColor:null,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              chatDto!.images!.isNotEmpty || chatDto!.videos!.isNotEmpty?  10.y:2.y,

              ///images show
              chatDto!.images!.isNotEmpty?

                  Align(
                      alignment: chatDto!.sender == senderId
                          ? Alignment.centerRight
                          : Alignment.centerLeft,

                      child: Container(height: 250,width: 250,

                        color: chatDto!.sender != senderId
                            ? AppColors.chatColor
                            : AppColors.borderColor,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Center(
                            child: Wrap(
                             //alignment: WrapAlignment.spaceEvenly,
                            //runSpacing: 2,
                              spacing: 2,
                            alignment: WrapAlignment.spaceEvenly,

                            //verticalDirection: VerticalDirection.up,

                            children: chatDto!.images!.take(4).map((e) {
                            print("${ApiConstant.baseUrl}$e");
                              return GestureDetector(
                                onTap: (){
                                  Navigate.to(context, ImagePreview(imageUrl: "${ApiConstant.baseUrl}$e"));
                                },
                                child: CachedImage(url: "${ApiConstant.baseUrl}$e",fit: BoxFit.fill
                                  ,isCircle: false,
                                height: chatDto!.images!.length>2?null:250,
                                  width: chatDto!.images!.length>1?110:250,
                                ),
                              );

                            }).toList(),

                                              ),
                          ),
                        ),))
                  :const SizedBox(),
              chatDto!.images!.isNotEmpty || chatDto!.videos!.isNotEmpty?  10.y:2.y,
              ///videos show
              chatDto!.videos!.isNotEmpty?

              Align(
                  alignment: chatDto!.sender == senderId
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(height: chatDto!.images!.isNotEmpty? 120:250,width: 250,

                    color: chatDto!.sender != senderId
                        ? AppColors.chatColor
                        : AppColors.borderColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: chatDto!.images!.isNotEmpty? 100: 250,
                        width: 250,
                        child: Center(
                          child: Wrap(
                            //alignment: WrapAlignment.spaceEvenly,
                            //runSpacing: 2,
                            spacing: 2,
                            alignment: WrapAlignment.spaceEvenly,

                            //verticalDirection: VerticalDirection.up,

                            children: chatDto!.videos!.map((e) {
                              print("${ApiConstant.baseUrl}$e");


                              return FutureBuilder(
                                builder: (context,dd) {
                                  if (dd.connectionState == ConnectionState.waiting) {
                                    return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)); // Show a loading indicator
                                  }
                                  else if (dd.hasError) {
                                    return const Center(child: Icon(Icons.play_circle_outline)); // Show an error message
                                  }
                                  else {

                                    PlatformFile? pff = PlatformFile(name: "thumbnail ${DateTime.now().microsecondsSinceEpoch}", size: 10 *1024 *3,path: dd.data);

                                    return GestureDetector(
                                      onTap: (){

                                          Navigate.to(context,VideoPreview(url: "${ApiConstant.baseUrl}$e"));
                                        },
                                      child: Stack(
                                        children: [
                                          Container(
                                            color: AppColors.productTileColor,
                                            height: 250,
                                            child:  Image.file(
                                                File(pff.path!),
                                                fit: BoxFit.fill,
                                              ),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              bottom: 0,
                                              child: Icon(Icons.play_circle,size:50.sp,color: AppColors.primaryColor,))
                                        ],
                                      ),
                                    );
                                  }
                                  // else{
                                  //   return const CircularProgressIndicator(color: AppColors.primaryColor,);
                                  //
                                  // }
                                }, future: getThumbnailFromVideo("${ApiConstant.baseUrl}$e"),
                              );



                            }).toList(),

                          ),
                        ),
                      ),
                    ),))
                  :const SizedBox(),
              chatDto!.images!.isNotEmpty || chatDto!.videos!.isNotEmpty?  10.y:2.y,
           ///Docs show
              ValueListenableBuilder(
                builder: (context,downloadValue,ss) {

                  return chatDto!.docs!.isNotEmpty?



                  Align(
                      alignment: chatDto!.sender == senderId
                          ? Alignment.centerRight
                          : Alignment.centerLeft,

                      child: GestureDetector(
                        onTap: ()
                        async {
                  //savedPath="sdasd";


                          final result= await OpenFile.open(savedPath.value[index!.toInt()]??"");
                          if(result.type ==ResultType.fileNotFound)
                            {
                              //print("hereeeeeeeeeee");
                            //  final dire = await AppPermissions.prepareSaveDir();
                          //XFile(chatDto?.docs![0],name: "testing").saveTo(dire.path);
                         // savedPath=dire.path+"testing";



                          print("This is download path ${ApiConstant.baseUrl}${chatDto?.docs![0]}");
                              //savedPath= await FileDownloader.download(chatDto?.docs![0]);
                          //var tempDir = await getTemporaryDirectory();
                          final  String fileName=extractFilenameFromUrl(chatDto!.docs![0]);
                          //ApiConstant


                          bool? perm=await DioDownloader().checkPermission();
                          print(perm.toString()+"ppepeppe");
                         if(perm ==true) {
                           Directory saveDirectory=await DioDownloader.prepareSaveDir();
                           savedPath.value[index!.toInt()]="${saveDirectory.path}$fileName";
                          // DioDownloader().savedPath.notifyListeners();

                           print("${savedPath.value[index]}saveeedddddddd");

                           await DioDownloader().download(Dio(), '${ApiConstant.baseUrl}${chatDto?.docs![0]}', "${saveDirectory.path}$fileName");
                   // Timer.periodic(Duration(), (timer) { });
                           //Timer.periodic(Duration(seconds: ), (timer) { })
                           await OpenFile.open(savedPath.value[index]);
                          savedPath.notifyListeners();

                         }
                         else{
                           WidgetFunctions.instance.snackBar(context,text: "Please grant Permission",bgColor: AppColors.primaryColor);
                         }





                            }
                          else{


                          }
                          //print(result.type);

                        },
                        child: Container(height: 50,

                          color: chatDto!.sender != senderId
                              ? AppColors.chatColor
                              : AppColors.borderColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                           // const AssetImageWidget(url:"assets/images/docimage.jpeg",height: 30,width: 30, ),
                            const Icon(Icons.picture_as_pdf_outlined),
                            Expanded(
                              child: AppText(extractFilenameFromUrl(chatDto!.docs![0]),
                                  maxLine: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.circularStdMedium(context,fontSize: 12)),
                            ),
                           savedPath.value[index!.toInt()]==null? const Icon(Icons.download):const SizedBox()



                          ],),),
                      ))
                      :const SizedBox();
                }, valueListenable:savedPath,
              ),
              chatDto!.images!.isNotEmpty || chatDto!.videos!.isNotEmpty?  10.y:4.y,
           ///content messages
              chatDto!.content !=  null  && chatDto!.content!.isNotEmpty ?   Align(
                alignment: chatDto!.sender == senderId
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(


                  padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                  decoration: BoxDecoration(
                    borderRadius: chatDto!.sender != senderId
                        ? BorderRadius.only(
                            bottomRight: Radius.circular(10.sp),
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp))
                        : BorderRadius.only(
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp),
                            bottomLeft: Radius.circular(10.sp),
                          ),
                    color: chatDto!.sender != senderId
                        ? AppColors.chatColor
                        : AppColors.primaryColor,
                  ),
                  child:
                       Text(chatDto!.content ?? "",
                          textScaleFactor: 1,
                          style: Styles.circularStdRegular(context,
                              color: chatDto!.sender != senderId
                                  ? AppColors.blackColor
                                  : AppColors.whiteColor)),
                ),
              ):const SizedBox(),
              chatDto!.images!.isNotEmpty || chatDto!.videos!.isNotEmpty?  10.y:5.y,
              Align(
                alignment: chatDto!.sender != senderId
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: AppText(chatDto!.createdAt!.toHourAndMinutes
                  ,
                    style: Styles.circularStdRegular(context,
                        color: AppColors.greyTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getThumbnailFromVideo(String url) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 250,
      maxHeight: 130,
      quality: 20
    );
    print("here"+fileName.toString());

    final file = File(fileName!);
    print("hereeee${file.path}");
    print("hereeee${file}");// Your file path
    String dir = path.dirname(file.path); // Get directory
    String newPath = path.join(dir,
        'thumbnail_${DateTime.now().millisecondsSinceEpoch}.jpg'); // Rename
    file.renameSync(newPath);

    return newPath;
  }

  String extractFilenameFromUrl(String url) {
    try {
      // Split the URL using the last '/' character
      List<String> parts = url.split('/');

      // Get the last part, which should be the filename
      String filename = parts.last;

      // If there's a query string, remove it
      if (filename.contains('?')) {
        filename = filename.split('?').first;
      }

      // Return the filename
      return filename.trim();
    } catch (error) {
      // Handle any errors gracefully, e.g., log the error
      return ''; // Return an empty string if there's an error
    }
  }
}
