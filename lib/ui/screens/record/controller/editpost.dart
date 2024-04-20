import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditPost extends GetxController {
  List<String> symptoms = <String>[].obs;
  List<String> diagnosis = <String>[].obs;
  List<String> treatment = <String>[].obs;
  List<File> records = <File>[].obs;

  List<String> recordUrls = <String>[];
}
