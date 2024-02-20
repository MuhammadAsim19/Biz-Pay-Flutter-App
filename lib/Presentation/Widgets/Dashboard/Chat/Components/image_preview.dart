import 'dart:isolate';
import 'dart:ui';

import 'package:buysellbiz/Data/DataSource/Resources/colors_pallete.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ImagePreview extends StatefulWidget {
  final String imageUrl;
  const ImagePreview({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  bool isLoading = false;
  // final dio = Dio();
  int progress = 0;

  // ReceivePort receivePort = ReceivePort();
  //
  // static downloadCallBack(id, status, progress) {
  //   SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");
  //   sendPort!.send(progress);
  // }

  @override
  void initState() {
    // IsolateNameServer.registerPortWithName(receivePort.sendPort, "downloading");
    // receivePort.listen((message) {
    //   setState(() {
    //     progress = message;
    //   });
    // });
    // FlutterDownloader.registerCallback(downloadCallBack);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // AppBar(
      //   automaticallyImplyLeading: true,
      //   elevation: 0,
      //   backgroundColor: AppColors.blackColor,
      //   actions: [
      //
      //     Padding(
      //       padding: const EdgeInsets.only(right: 4.0),
      //       child: IconButton(
      //         icon: const Icon(Icons.more_vert_rounded),
      //         onPressed: () {
      //           _settingModalBottomSheet(context, "$scheme://$baseUrl/${widget.imageUrl}");
      //         },
      //       ),
      //     )
      //
      //   ],
      // ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: AppColors.whiteColor,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: InteractiveViewer(
                    // scaleEnabled: true,
                      panEnabled: true,
                      child: CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          placeholder: (context, image) => const SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(),
                          ))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 31.0),
                child: CustomAppBar(
leading: true,
                  title: 'Image',
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(top: 110.0),
      //   child: FloatingActionButton.small(
      //     backgroundColor: AppColors.blackColor,
      //     onPressed: () async {
      //       // FileSaver.hasAcceptedPermissions(
      //       //     download: () async => );
      //
      //       // await FileSaver.download(
      //       //   '$scheme://$baseUrl/${widget.imageUrl}',
      //       // );
      //     },
      //     child: SvgPicture.asset(
      //       Assets.download,
      //       width: 20,
      //       height: 20,
      //       color: AppColors.yellowColor,
      //     ),
      //   ),
      // ),
    );
  }


}