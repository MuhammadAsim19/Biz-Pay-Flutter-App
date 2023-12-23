import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_path_provider/android_path_provider.dart';

class AppPermissions {
  ///MEDIA_LOCATION
  static Future<bool> hasAccessMediaPermission({Function()? onSuccess}) async {
    //ask for permission
    await Permission.accessMediaLocation.request();
    var status = await Permission.accessMediaLocation.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.accessMediaLocation.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }

  static Future<bool> hasAccessNotificationPermission(
      {Function()? onSuccess}) async {
    //ask for permission
    await Permission.notification.request();
    var status = await Permission.notification.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.accessMediaLocation.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }

  static Future<bool> _checkPermission() async {
    if (Platform.isIOS) {
      return true;
    }

    if (Platform.isAndroid) {
      // final info = await DeviceInfoPlugin().androidInfo;
      // if (info.version.sdkInt > 28) {
      //   return true;
      // }
      return true;

      final status = await Permission.accessMediaLocation.status;
      if (status == PermissionStatus.granted) {
        return true;
      }

      final result = await Permission.accessMediaLocation.request();
      return result == PermissionStatus.granted;
    }

    throw StateError('unknown platform');
  }

  static Future<bool> hasStoragePermission({Function()? onSuccess}) async {
    bool permissionReady = await _checkPermission();
    if (permissionReady) {
      //   await prepareSaveDir();
      onSuccess!();
      return true;
    }
    // await Permission.manageExternalStorage.request();
    //
    // var status = await Permission.manageExternalStorage.status;
    //
    // if(status.isGranted){
    //   onSuccess!();
    //   return true;
    //
    // }
    return false;
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

  ///Camera
  static Future<bool> hasAccessCameraPermission({Function()? onSuccess}) async {
    //ask for permission
    await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.camera.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }

  ///Camera
  static Future<bool> hasWritePermission({Function()? onSuccess}) async {
    //ask for permission
    await Permission.manageExternalStorage.request();
    var status = await Permission.manageExternalStorage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.storage.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }
}
