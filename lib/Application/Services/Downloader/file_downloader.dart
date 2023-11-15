import 'dart:io';
import 'dart:typed_data';

import 'package:buysellbiz/Data/AppData/app_permision.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:path_provider/path_provider.dart';

class FileDownloader {
  late final Uint8List _imageBytes;

  Uint8List get imageBytes => _imageBytes;
  final File _path = File('');

  File get path => _path;

  // Future<Uint8List?> capturePng(
  //   GlobalKey widgetKey,
  // ) async {
  //   Uint8List? data;
  //   RenderRepaintBoundary? boundary =
  //       widgetKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  //   ui.Image? image = await boundary?.toImage(pixelRatio: 2);
  //
  //   await image?.toByteData(format: ui.ImageByteFormat.png).then((val) {
  //     data = val?.buffer.asUint8List();
  //   });
  //   if (kDebugMode) {
  //     print(data);
  //   }
  //   return data;
  // }

  // Future<Uint8List> takeImageBytes(String imgPath) async {
  //   ByteData byteData =
  //       await NetworkAssetBundle(Uri.parse(imgPath)).load(imgPath);
  //   // await rootBundle.load('assets/itech/$imgPath');
  //   if (kDebugMode) {
  //     print(byteData.buffer.asUint8List());
  //   }
  //   return byteData.buffer.asUint8List();
  // }

  // Future saveImage(Uint8List bytes, String url) async {
  //   try {
  //     final directory = await getExternalStorageDirectory();
  //     final myImagePath =
  //         '${directory?.parent.parent.parent.parent.path}/LaunchArt';
  //     final myImgDir = await Directory(myImagePath).create();
  //
  //     File file = File(
  //         "${myImgDir.path}/launchArt_image_${DateTime.now().microsecond}${url.split('.').last}");
  //     file.writeAsBytes(bytes);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('eeeeeeeeeeee:$e');
  //     }
  //   }
  // }

  static Future download(String url) async {
    // final directory = await getExternalStorageDirectory();
    // final directory = await getExternalStorageDirectory();
    if (Platform.isIOS) {
      Directory? directory = await getApplicationDocumentsDirectory();
      final myFilePath = '${directory.path}/HbkApp';

      final myImgDir = await Directory(myFilePath).create();
      // print(myImgDir);
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        headers: {},
        // optional: header send with url (auth token etc)
        savedDir: myImgDir.path,
        showNotification: false,
        // show download progress in status bar (for Android)
        openFileFromNotification: true,
        // click on notification to open downloaded file (for Android)
        saveInPublicStorage: true,
      );
      print(taskId);
    } else {
      await AppPermissions.hasStoragePermission(onSuccess: () async {
        List<Directory>? directory = await getExternalStorageDirectories(
            type: StorageDirectory.downloads);
        final myFilePath = '${directory![0].path}/HbkApp';
        final dire = await AppPermissions.prepareSaveDir();

        final myImgDir = await Directory(myFilePath).create();
        // print(myImgDir);
        final taskId = await FlutterDownloader.enqueue(
          url: url,
          headers: {},
          // optional: header send with url (auth token etc)
          savedDir: dire.path,
          showNotification: false,
          //  showNotification: true,
          // show download progress in status bar (for Android)
          openFileFromNotification: true,
          // click on notification to open downloaded file (for Android)
          saveInPublicStorage: true,
        );
        // if (taskId != null) {
        //   await FlutterDownloader.open(taskId: taskId);
        // }
        print(taskId);
      });
    }
  }
}
