import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:healify/utils/constants.dart';
import 'package:http/http.dart' as http;

class Post {
  Future<void> saveReport(
      String title,
      String date,
      List<String>? symptoms,
      List<String>? diagnosis,
      List<String>? treatment,
      List<String>? reports,
      String userid) async {
    var data = {
      "title": title,
      "date": date,
      "symptoms": symptoms ?? [],
      "diagnosis": diagnosis ?? [],
      "treatment": treatment ?? [],
      "reports": reports ?? [],
      "userid": userid
    };

    var jsonString = jsonEncode(data);
    var response =
        await http.post(Uri.parse("${ServerUrl}saveRecord"), body: jsonString);

    if (response.statusCode == 200) {
      Get.snackbar("Success", "Profile Saved Successfullly");
    } else {
      if (kDebugMode) {
        print(response.statusCode.toString());
      }
      if (kDebugMode) {
        print(response.body.toString());
      }
      Get.snackbar("Faliure", response.body.toString());
      throw Exception("Failed to fetch data : ${response.body}");
    }
  }

  Future<void> updateRecord(
      String id,
      String title,
      String date,
      List<String>? symptoms,
      List<String>? diagnosis,
      List<String>? treatment,
      List<String>? reports,
      String userid) async {
    var data = {
      "id": id,
      "title": title,
      "date": date,
      "symptoms": symptoms ?? [],
      "diagnosis": diagnosis ?? [],
      "treatment": treatment ?? [],
      "reports": reports ?? [],
      "userid": userid
    };

    var jsonString = jsonEncode(data);
    var response = await http.post(Uri.parse("${ServerUrl}updateRecord"),
        body: jsonString);

    if (response.statusCode == 200) {
      Get.snackbar("Success", "Record Updated Successfullly");
    } else {
      if (kDebugMode) {
        print(response.statusCode.toString());
      }
      if (kDebugMode) {
        print(response.body.toString());
      }
      Get.snackbar("Faliure", response.body.toString());
      throw Exception("Failed to Upload data : ${response.body}");
    }
  }
}
