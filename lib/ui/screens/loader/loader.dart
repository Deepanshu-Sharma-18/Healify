import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healify/ui/screens/home/home.dart';
import 'package:healify/ui/screens/profile/CreateProfile.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/utils/colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      await profileController
          .getProfile(FirebaseAuth.instance.currentUser!.uid);
      Get.off(() => HomeScreen());
    } catch (e) {
      Get.off(() => CreateProfile());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: Container(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              color: ColorTheme.green,
            ),
          ),
        ),
      )),
    );
  }
}
