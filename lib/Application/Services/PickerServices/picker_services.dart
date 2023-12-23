import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

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

  static Future<PlatformFile?> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
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
    return result.files.first;
  }
  static Future<List<PlatformFile>?> pickMultipleFiles(List<String>? allowedExtension,bool? allowMultiple ) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: allowMultiple??false,
       allowedExtensions: allowedExtension
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
