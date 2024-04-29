import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/textfield.dart';
import 'package:healify/ui/screens/home/home.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/post.dart';
import 'package:healify/utils/colors.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController name;
  late TextEditingController username;
  late TextEditingController age;
  late TextEditingController gender;
  late TextEditingController weight;
  late TextEditingController height;
  late TextEditingController bloodGroup;

  var profileController = Get.find<ProfileController>();
  var loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: profileController.profile.data!.name!);
    username =
        TextEditingController(text: profileController.profile.data!.username!);
    age = TextEditingController(text: profileController.profile.data!.age!);
    gender =
        TextEditingController(text: profileController.profile.data!.gender!);
    weight =
        TextEditingController(text: profileController.profile.data!.weight!);
    height =
        TextEditingController(text: profileController.profile.data!.height!);
    bloodGroup = TextEditingController(
        text: profileController.profile.data!.bloodgroup!);
  }

  Future<void> saveProfile() async {
    Get.back();
    await profileController.updateProfile(
        profileController.profile.data!.id!.toString(),
        name.text,
        username.text,
        height.text,
        weight.text,
        age.text,
        bloodGroup.text,
        gender.text,
        loginController.accountNo.toString(),
        "",
        profileController.profile.data!.authId!.toString());

    await profileController
        .getProfile(profileController.profile.data!.authId!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                MyText(
                  text: "Edit Profile",
                  fontsize: 25,
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 30,
                ),
                MyText(
                  text: "Name",
                  fontsize: 17,
                  fontweight: FontWeight.w700,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                    controller: name,
                    hintText: "Enter name",
                    labelText: "Name"),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  text: "Userame",
                  fontsize: 17,
                  fontweight: FontWeight.w700,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                    controller: username,
                    hintText: "Enter username",
                    labelText: "Username"),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  text: "Age",
                  fontsize: 17,
                  fontweight: FontWeight.w700,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                    controller: age,
                    hintText: "Enter your age",
                    labelText: "Age"),
                SizedBox(
                  height: 30,
                ),
                MyText(
                  text: "Gender",
                  fontsize: 17,
                  fontweight: FontWeight.w700,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                    controller: gender,
                    hintText: "Enter your gender",
                    labelText: "Gender"),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  text: "Weight",
                  fontsize: 17,
                  fontweight: FontWeight.w700,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                    controller: weight,
                    hintText: "Enter your weight in Kg",
                    labelText: "Weight"),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  text: "Height",
                  fontsize: 17,
                  fontweight: FontWeight.w700,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                    controller: height,
                    hintText: "Enter your height in cm",
                    labelText: "Height"),
                SizedBox(
                  height: 30,
                ),
                MyText(
                  text: "BloodGroup",
                  fontsize: 17,
                  fontweight: FontWeight.w700,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                    controller: bloodGroup,
                    hintText: "Enter your blood group",
                    labelText: "Blood Group"),
                SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                  onPressed: () async {
                    //await saveProfile();
                    Get.off(() => HomeScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorTheme.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    alignment: Alignment.center,
                    child: MyText(
                      text: "Proceed",
                      fontcolor: Colors.black,
                      fontsize: 17,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
