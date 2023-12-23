import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:dio/dio.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DioDownloader{

  Future download(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) { return status! < 500; }
        ),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();

      // Here, you're catching an error and printing it. For production
      // apps, you should display the warning to the user and give them a
      // way to restart the download.
    } catch (e) {
      print(e);
    }
  }
  ValueNotifier<double> progress = ValueNotifier(0);
  ValueNotifier<String> savedPath=ValueNotifier("");

  // Track if the PDF was downloaded here.
  ValueNotifier<bool> didDownloadfile = ValueNotifier(false);

  // Show the progress status to the user.
  ValueNotifier<String> progressString = ValueNotifier('File has not been downloaded yet.');
  void updateProgress(done, total) async {
    print(done);
    progress.value = done / total;

    print(progress.value);
    print(didDownloadfile.value);
    print(progressString.value);
      if (progress.value >= 1) {
        progressString.value = '✅ File has finished downloading. Try opening the file.';
        didDownloadfile.value = true;

print("in  downloadedddd+${savedPath.value}");


      } else {
        progressString.value = 'Download progress: ${(progress.value * 100).toStringAsFixed(0)}% done.';
      }
      progress.notifyListeners();
      didDownloadfile.notifyListeners();
      progressString.notifyListeners();

  }

  Future<bool?> checkPermission() async {
    if (Platform.isAndroid ) {
      print("here");
      //final status = await Permission.storage.status;
      final result = await Permission.manageExternalStorage.request();
      if (result == PermissionStatus.granted) {
        return true;
      }else {
        return true;
      }
    } else {
      return true;
    }
    return null;
    //return false;
  }
  static Future<Directory> prepareSaveDir() async {
    String? localPath = (await getSavedDir())!;
    final savedDir = Directory('$localPath/bizzpay');
    if (await savedDir.exists() == false) {
      await savedDir.create();
    }
    print('in Saved');
    print(savedDir);

    return savedDir;
  }
  static Future<String?> getSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
        print("main directory inn$externalStorageDirPath");
      } catch (err, st) {
        print('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      // var dir = (await _dirsOnIOS)[0]; // temporary
      // var dir = (await _dirsOnIOS)[1]; // applicationSupport
      // var dir = (await _dirsOnIOS)[2]; // library
      var dir = (await _dirsOnIOS)[3]; // applicationDocuments
      // var dir = (await _dirsOnIOS)[4]; // downloads

      dir ??= await getApplicationDocumentsDirectory();
      externalStorageDirPath = dir.absolute.path;
    }

    return externalStorageDirPath;
  }
  static Future<List<Directory?>> get _dirsOnIOS async {
    final temporary = await getTemporaryDirectory();
    final applicationSupport = await getApplicationSupportDirectory();
    final library = await getLibraryDirectory();
    final applicationDocuments = await getApplicationDocumentsDirectory();
    final downloads = await getDownloadsDirectory();

    final dirs = [
      temporary,
      applicationSupport,
      library,
      applicationDocuments,
      downloads
    ];

    return dirs;
  }
}
