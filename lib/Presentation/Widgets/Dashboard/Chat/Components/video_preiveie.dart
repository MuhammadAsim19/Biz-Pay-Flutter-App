import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  const VideoPreview({required this.url, Key? key}) : super(key: key);
  final String url;

  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _controller;
  int totalSeconds = 0;
  int currentValue = 0;

  // int currentValue = 0;
  @override
  void initState() {
    // Future.wait([
    //   NotificationService().initNotification(),
    // ]);

    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    _controller = VideoPlayerController.network(widget.url,
        httpHeaders: {"Accept": 'application/${widget.url.split('.').last}'},
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((_) async {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        // _controller.dataSourceType.
        _controller.value.position;
        // _controller.position
        //     .then((value) => currentValue = value!.inSeconds.toInt());
        _controller.play();
        setState(() {});
      });
  }
  // _registerCallback();
  //   IsolateNameServer.registerPortWithName(
  //       _port.sendPort, 'downloader_send_port');
  //   _port.listen((dynamic data) {
  //     String id = data[0];
  //     DownloadTaskStatus status = data[1];
  //     int progress = data[2];
  //     setState(() {});
  //   });
  // }

  // _registerCallback() async {
  //   await FlutterDownloader.registerCallback(downloadCallback);
  // }
  //
  // final ReceivePort _port = ReceivePort();
  //
  // @pragma('vm:entry-point')
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send =
  //   IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send?.send([id, status, progress]);
  // }

  //
  // IsolateNameServer.registerPortWithName(
  //     _port.sendPort, 'downloader_send_port');
  // _port.listen((dynamic data) {
  //   setState(() {});
  // });

  //   FlutterDownloader.registerCallback(downloadCallback);
  // }
  //
  // final ReceivePort _port = ReceivePort();
  //
  // @pragma('vm:entry-point')
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) async {
  //   final SendPort? send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send?.send([id, status, progress]);
  //   log("ISOLATE $send $progress");
  //   if (status.value == 3 && progress == 100) {
  //     PushNotificationServices().showNotification(1, "Data", "adasdsadasdad");
  //   }
  // }
  //

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _controller.value.isInitialized
          ? Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    orientation == Orientation.portrait
                        ? const CustomAppBar(
                      title: 'Video',
                      leading: true,
                    )
                        : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
                    // orientation == Orientation.portrait
                    //     ? const Spacer()
                    //     : const SizedBox(
                    //   height: 0,
                    //   width: 0,
                    // ),
                    100.y,
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            //  aspectRatio:  orientation == Orientation.portrait?3/2:5/2,
                            aspectRatio: orientation == Orientation.portrait
                                ?  4/ 3
                                : _controller.value.aspectRatio * 3,
                            child: VideoPlayer(_controller),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(80),
                                child: _controller.value.isPlaying
                                    ? const SizedBox(
                                  width: 30,
                                  height: 30,
                                )
                                    : const Icon(
                                  Icons.play_circle,
                                  size: 40,
                                  color: AppColors.primaryColor,
                                ),
                              )),
                          Positioned(
                            bottom: 15,
                            child: SizedBox(
                              height: 40,
                              width: orientation != Orientation.portrait
                                  ? MediaQuery.of(context).size.width * 0.50
                                  : MediaQuery.of(context).size.width * 0.70,
                              child: Column(
                                //  crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 1.0),
                                          child: ValueListenableBuilder(
                                              valueListenable: _controller,
                                              builder: (context, val, child) {
                                                return Text(
                                                  videoDuration(val.position),
                                                  style: const TextStyle(
                                                      color:
                                                      AppColors.whiteColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w700),
                                                );
                                              }),
                                        ),
                                        Text(
                                          "/",
                                          style: Styles.circularStdRegular(context,
                                              color: AppColors.whiteColor),
                                        ),
                                        // const Spacer(),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              videoDuration(
                                                  _controller.value.duration),
                                              style: const TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: VideoProgressIndicator(
                                      _controller,
                                      padding: const EdgeInsets.all(8),
                                      colors: const VideoProgressColors(
                                        playedColor:
                                        AppColors.primaryColor,
                                        backgroundColor: AppColors.whiteColor,
                                        bufferedColor: Color(0x90656464),
                                      ),
                                      allowScrubbing: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: orientation != Orientation.portrait
                                  ? GestureDetector(
                                onTap: () {
                                  // context
                                  //     .read<GalleryDataCubit>()
                                  //     .getGalleryData(
                                  //         false, "all", false);
                                  Navigator.pop(context);
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColors.primaryColor,
                                  size: 30.r,
                                ),
                              )
                                  : const SizedBox(
                                height: 0,
                                width: 0,
                              )),
                          Positioned(
                            bottom: 30,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                if (orientation != Orientation.portrait) {
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.portraitUp,
                                  ]);
                                } else {
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.landscapeRight,
                                    DeviceOrientation.landscapeLeft,
                                  ]);
                                }
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Icon(
                                Icons.screen_rotation_alt,
                                color: AppColors.whiteColor.withOpacity(0.7),
                                size: 25.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    orientation == Orientation.portrait
                        ? const Spacer()
                        : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
                  ],
                ),
              ),
            ),
          )
          : const Center(
        child:
      CircularProgressIndicator(color: AppColors.primaryColor,)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(top: 110.0),
      //   child: FloatingActionButton.small(
      //     backgroundColor: AppColors.blackColor,
      //     onPressed: () async {
      //       // await FileSaver.hasAcceptedPermissions(
      //       //     download: () async => await FileSaver.download(
      //       //       '$scheme://$baseUrl/${widget.url}',
      //       //     ));
      //
      //       // await NotificationService()
      //       //     .showNotification(1, "Sanga chal dy", "Shampoo");
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

  String videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.values.first);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    // IsolateNameServer.removePortNameMapping('downloader_send_port');

    _controller.dispose();
  }
}
