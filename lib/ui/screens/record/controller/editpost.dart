import 'dart:io';

import 'package:get/get.dart';
import 'package:healify/models/file.dart';
import 'package:healify/models/user.dart';

class EditPost extends GetxController {
  List<String> symptoms = <String>[].obs;
  List<String> diagnosis = <String>[].obs;
  List<String> treatment = <String>[].obs;
  List<File> newrecords = <File>[].obs;

  List<Report> records = <Report>[].obs;

  Rx<DateTime> date = DateTime.now().obs;

  List<FileModel> filesToUpload = <FileModel>[];

  void updateLists(List<String>? symptoms, List<String>? diagnosis,
      List<String>? treatment, List<Report>? records) {
    this.symptoms.addAll(symptoms ?? []);
    this.diagnosis.addAll(diagnosis ?? []);
    this.treatment.addAll(treatment ?? []);
    this.records.addAll(records ?? []);
  }
}
