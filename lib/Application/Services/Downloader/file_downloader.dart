import 'dart:io';
import 'dart:typed_data';

import 'package:buysellbiz/Data/AppData/app_permision.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';

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

//   static Future download(String url) async {
//     // final directory = await getExternalStorageDirectory();
//     // final directory = await getExternalStorageDirectory();
//     if (Platform.isIOS) {
//       Directory? directory = await getApplicationDocumentsDirectory();
//       final myFilePath = '${directory.path}/bizpay';
//
//       final myImgDir = await Directory(myFilePath).create();
//       // print(myImgDir);
//       final taskId = await FlutterDownloader.enqueue(
//         url: url,
//         headers: {},
//         // optional: header send with url (auth token etc)
//         savedDir: myImgDir.path,
//         showNotification: false,
//         // show download progress in status bar (for Android)
//         openFileFromNotification: true,
//         // click on notification to open downloaded file (for Android)
//         saveInPublicStorage: true,
//       );
//       print(taskId);
//     } else {
//       await AppPermissions.hasStoragePermission(onSuccess: () async {
//         List<Directory>? directory = await getExternalStorageDirectories(
//             type: StorageDirectory.downloads);
//         final myFilePath = '${directory![0].path}/buysell';
//         final dire = await AppPermissions.prepareSaveDir();
// print(dire);
//         final myImgDir = await Directory(myFilePath).create();
//         // print(myImgDir);
//         final taskId = await FlutterDownloader.enqueue(
//           url: url,
//           headers: {},
//           // optional: header send with url (auth token etc)
//           savedDir: dire.path,
//           showNotification: false,
//           //  showNotification: true,
//           // show download progress in status bar (for Android)
//           openFileFromNotification: true,
//           // click on notification to open downloaded file (for Android)
//           //saveInPublicStorage: true,
//         );
//         if (taskId != null) {
//           print("task is... downloaded");
//           print(taskId);
//           await FlutterDownloader.open(taskId: taskId);
//           return dire.path;
//
//         }
//
//
//       });
//     }
//   }
  static Future<File?> tempFilePath(Uint8List data) async {
    File? file;
    if (Platform.isIOS) {
      Directory? tempDir = await getApplicationDocumentsDirectory();
      print("here");
      File? tempFile = await File(
          '${tempDir.path}/${DateTime.now().year}_${DateTime.now().month}${DateTime.now().millisecond}_${DateTime.now().month}${DateTime.now().millisecond}.pdf')
          .create(recursive: false);
      //print("filee ${file!.path}");

      file = await tempFile.writeAsBytes(data);

      //await file.writeAsBytes(data);

      return file;
    } else {
      bool check =
      await AppPermissions.hasStoragePermission(onSuccess: () async {
        // print()
        //file=temp;
        //print("filee2 ${temp!.path}");

        // await FileDownloader.download(file.uri.path);
      });
      //  print("nooo ${file?.absolute}");

      if (check == true) {
        Directory? tempDir = await AppPermissions.prepareSaveDir();
        print("here in hbk data ${tempDir.path}");
        // File? tempFile = await File(
        //         '${tempDir!.parent.parent.parent.parent.path}/Documents/${DateTime.now().year}_${DateTime.now().month}${DateTime.now().millisecond}_${DateTime.now().month}${DateTime.now().millisecond}.pdf')
        //     .create(recursive: false);
        //print("filee ${file!.path}");
        File? tempFile = await File(
            '${tempDir.path}/${DateTime.now().year}_${DateTime.now().month}${DateTime.now().millisecond}_${DateTime.now().month}${DateTime.now().millisecond}.pdf')
            .create(recursive: false);
        file = await tempFile.writeAsBytes(data);

        //await file.writeAsBytes(data);

        return file;
      } else {
        return null;
      }
    }
  }
}
