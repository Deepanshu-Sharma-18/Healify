import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/repository/bottomnav.dart';
import 'package:healify/ui/screens/profile/editProfile.dart';
import 'package:healify/ui/screens/profile/profileScreen.dart';
import 'package:healify/utils/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var bottomNavController = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorTheme.grey,
      ),
      height: 60,
      width: double.maxFinite,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (bottomNavController.active != 0) {
                  bottomNavController.updateActive(0);
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: bottomNavController.active == 0
                        ? ColorTheme.green
                        : Colors.white),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (bottomNavController.active != 1) {
                  bottomNavController.updateActive(1);
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: bottomNavController.active == 1
                        ? ColorTheme.green
                        : Colors.white),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (bottomNavController.active != 2) {
                  bottomNavController.updateActive(2);
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: bottomNavController.active == 2
                        ? ColorTheme.green
                        : Colors.white),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (bottomNavController.active != 3) {
                  bottomNavController.updateActive(3);
                  Get.off(() => ProfileScreen());
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: bottomNavController.active == 3
                        ? ColorTheme.green
                        : Colors.white),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
