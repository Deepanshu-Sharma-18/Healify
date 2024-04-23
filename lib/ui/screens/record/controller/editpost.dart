import 'dart:io';

import 'package:get/get.dart';
import 'package:healify/models/user.dart';

class EditPost extends GetxController {
  List<String> symptoms = <String>[].obs;
  List<String> diagnosis = <String>[].obs;
  List<String> treatment = <String>[].obs;
  List<File> records = <File>[].obs;

  List<Report> existingRecords = <Report>[].obs;

  Rx<DateTime> date = DateTime.now().obs;

  List<String> recordUrls = <String>[];

  void updateLists(List<String>? symptoms, List<String>? diagnosis,
      List<String>? treatment, List<Report>? records) {
    this.symptoms = symptoms ?? [];
    this.diagnosis = diagnosis ?? [];
    this.treatment = treatment ?? [];
    this.existingRecords = records ?? [];
  }
}
