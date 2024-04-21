import 'dart:io';

import 'package:get/get.dart';

class EditPost extends GetxController {
  var symptoms = <String>[].obs;
  var diagnosis = <String>[].obs;
  var treatment = <String>[].obs;
  var records = <File>[].obs;

  List<String> recordUrls = <String>[];
}
