import 'package:get/get.dart';
import 'package:healify/models/user.dart';
import 'package:healify/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  UserModel? profile;

  Future<void> getProfile(String authID) async {
    var response = await http
        .post(Uri.parse("${ServerUrl}getUser"), body: {"authid": authID});

    if (response.statusCode == 200) {
      profile = userModelFromMap(response.body);
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
    var response = await http.post(Uri.parse("${ServerUrl}getUser"), body: {
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
    });

    if (response.statusCode == 200) {
      Get.snackbar("Success", "Profile Saved Successfullly");
    } else {
      Get.snackbar("Faliure", response.body.toString());
      throw Exception("Failed to fetch data : ${response.body}");
    }
  }
}
