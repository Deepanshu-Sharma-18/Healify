import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/screens/auth/auth.dart';
import 'package:healify/ui/screens/auth/signin.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/editProfile.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profileController = Get.find<ProfileController>();
  var loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    fontsize: 25,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.bold,
                    text: "Profile",
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => EditProfile());
                    },
                    child: Container(
                      height: 45,
                      width: 105,
                      decoration: BoxDecoration(
                        color: ColorTheme.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                            fontsize: 16,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.w600,
                            text: "Edit",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          profileController.profile.data!.image!,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    fontsize: 15,
                    fontcolor: ColorTheme.darkgrey,
                    fontweight: FontWeight.w600,
                    text: "Name",
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w700,
                    text: profileController.profile.data!.name!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    fontsize: 15,
                    fontcolor: ColorTheme.darkgrey,
                    fontweight: FontWeight.w600,
                    text: "Username",
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w700,
                    text: profileController.profile.data!.username!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    fontsize: 15,
                    fontcolor: ColorTheme.darkgrey,
                    fontweight: FontWeight.w600,
                    text: "Age",
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w700,
                    text: profileController.profile.data!.age!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    fontsize: 15,
                    fontcolor: ColorTheme.darkgrey,
                    fontweight: FontWeight.w600,
                    text: "Gender",
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w700,
                    text: profileController.profile.data!.gender!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    fontsize: 15,
                    fontcolor: ColorTheme.darkgrey,
                    fontweight: FontWeight.w600,
                    text: "Bloodgroup",
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w700,
                    text: profileController.profile.data!.bloodgroup!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    fontsize: 15,
                    fontcolor: ColorTheme.darkgrey,
                    fontweight: FontWeight.w600,
                    text: "Height",
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w700,
                    text: profileController.profile.data!.height!,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    fontsize: 15,
                    fontcolor: ColorTheme.darkgrey,
                    fontweight: FontWeight.w600,
                    text: "Weight",
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w700,
                    text: profileController.profile.data!.weight!,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  await AuthController().auth.signOut();
                  Get.offAll(() => SignIn());
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorTheme.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: MyText(
                      fontsize: 15,
                      fontcolor: Colors.black,
                      fontweight: FontWeight.w600,
                      text: "Log Out",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
