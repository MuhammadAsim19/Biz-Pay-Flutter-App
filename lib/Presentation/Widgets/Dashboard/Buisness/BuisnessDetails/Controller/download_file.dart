import 'dart:io';
import 'package:buysellbiz/Application/Services/Downloader/DioDownloads/downloaderDio.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:dio/dio.dart';
import 'package:open_file_plus/open_file_plus.dart';

class DownloadFile {
  static ValueNotifier<String> savedPath = ValueNotifier('');

  static download(String file) async {
    final String fileName = extractFilenameFromUrl(file);

    bool? perm = await DioDownloader().checkPermission();
    print("${perm}ppepeppe");
    if (perm == true) {
      Directory saveDirectory = await DioDownloader.prepareSaveDir();
      savedPath.value = "${saveDirectory.path}$fileName";

      // savedPath.value[index!.toInt()] =
      // "${saveDirectory.path}$fileName";
      // DioDownloader().savedPath.notifyListeners();

      await DioDownloader().download(Dio(), '${ApiConstant.baseUrl}$file',
          "${saveDirectory.path}$fileName");

      await OpenFile.open(savedPath.value);
      savedPath.notifyListeners();
      // Timer.periodic(Duration(), (timer) { });
      //Timer.periodic(Duration(seconds: ), (timer) { })
      // await OpenFile.open();
      // savedPath.notifyListeners();
    } else {
      // WidgetFunctions.instance.snackBar(context,
      //     text: "Please grant Permission",
      //     bgColor: AppColors.primaryColor);
    }
  }

  static String extractFilenameFromUrl(String url) {
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
