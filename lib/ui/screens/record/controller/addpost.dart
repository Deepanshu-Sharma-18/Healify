import 'dart:io';

import 'package:get/get.dart';
import 'package:healify/models/file.dart';

class AddPost extends GetxController {
  List<String> symptoms = <String>[].obs;
  List<String> diagnosis = <String>[].obs;
  List<String> treatment = <String>[].obs;
  List<File> records = <File>[].obs;

  Rx<DateTime> date = DateTime.now().obs;

  List<FileModel> filesToUpload = <FileModel>[];
}
