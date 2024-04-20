import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:healify/models/user.dart';
import 'package:healify/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  UserModel? profile;

  RxBool _isNull = true.obs;

  bool get isProfileNull => _isNull.value;

  Future<void> getProfile(String authID) async {
    var data = {"authid": authID};
    var jsonString = jsonEncode(data);
    var response =
        await http.post(Uri.parse("${ServerUrl}getUser"), body: jsonString);

    if (response.statusCode == 200) {
      profile = userModelFromMap(response.body);
      _isNull.value = false;
    } else {
      throw Exception("Failed to fetch data : ${response.body}");
    }
  }

  Future<void> saveProfile(
      String name,
      String username,
      String height,
      String weight,
      String age,
      String bloodgroup,
      String gender,
      String address,
      String image,
      String authid) async {
    var data = {
      "name": name,
      "username": username,
      "height": height,
      "weight": weight,
      "age": age,
      "bloodgroup": bloodgroup,
      "image":
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      "authid": authid,
      "gender": gender,
      "address": address
    };

    var jsonString = jsonEncode(data);
    var response =
        await http.post(Uri.parse("${ServerUrl}saveUser"), body: jsonString);

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
}
