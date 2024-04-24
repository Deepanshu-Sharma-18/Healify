import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:healify/models/file.dart';
import 'package:healify/models/record.dart';
import 'package:healify/models/user.dart';
import 'package:healify/repository/web3.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/utils/constants.dart';
import 'package:http/http.dart' as http;

class Post {
  final web3controller = Get.find<Web3Controller>();
  final profileController = Get.find<ProfileController>();
  Future<void> saveReport(
      String title,
      String date,
      List<String>? symptoms,
      List<String>? diagnosis,
      List<String>? treatment,
      List<FileModel>? reports,
      String userid) async {
    var data = {
      "title": title,
      "date": date,
      "symptoms": symptoms ?? [],
      "diagnosis": diagnosis ?? [],
      "treatment": treatment ?? [],
      "reports": reports != null
          ? [
              for (var report in reports)
                {
                  "bucketname": report.bucketName,
                  "objectkey": report.objectKey,
                  "content": report.content,
                  "username": report.username
                },
            ]
          : [],
      "userId": userid
    };

    var jsonString = jsonEncode(data);
    var response =
        await http.post(Uri.parse("${ServerUrl}saveRecord"), body: jsonString);

    if (response.statusCode == 200) {
      Get.snackbar("Success", "Profile Saved Successfullly");

      var jsondecode = jsonDecode(response.body) as Map<String, dynamic>;
      await web3controller
          .addPatientFromBlockchain(profileController.profile!.data!.authId!);
      await web3controller.addRecordFromBlockchain(
          profileController.profile!.data!.authId!, jsondecode["id"]);
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
      List<FileModel>? reports,
      String userid) async {
    var data = {
      "id": id,
      "title": title,
      "date": date,
      "symptoms": symptoms ?? [],
      "diagnosis": diagnosis ?? [],
      "treatment": treatment ?? [],
      "reports": reports != null
          ? [
              for (var report in reports)
                {
                  "bucketname": report.bucketName,
                  "objectkey": report.objectKey,
                  "content": report.content,
                  "username": report.username
                },
            ]
          : [],
      "userId": userid
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

  Future<RecordModel> getRecord(String documentid) async {
    final data = {"documentid": documentid};

    var jsonString = jsonEncode(data);

    var response =
        await http.post(Uri.parse("${ServerUrl}getRecord"), body: jsonString);

    if (response.statusCode == 200) {
      return recordModelFromMap(response.body);
    } else {
      Get.snackbar("Faliure", response.body.toString());
      throw Exception("Failed to fetch data : ${response.body}");
    }
  }
}
