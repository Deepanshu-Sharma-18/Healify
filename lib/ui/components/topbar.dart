import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/profile/profileScreen.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();
    var profileController = Get.find<ProfileController>();

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(ProfileScreen()),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(profileController.isProfileNull
                              ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                              : profileController.profile!.data!.image!),
                        ),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    child: MyText(
                      fontsize: 15,
                      fontcolor: Colors.black,
                      fontweight: FontWeight.w500,
                      text: profileController.isProfileNull
                          ? "Hi there!"
                          : "Hello, " +
                              profileController.profile!.data!.name!
                                  .toString()
                                  .removeAllWhitespace +
                              "!",
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 183,
            child: W3MAccountButton(
              service: loginController.w3mService!,
              size: BaseButtonSize.values[0],
            ),
          ),
        ],
      ),
    );
  }
}
