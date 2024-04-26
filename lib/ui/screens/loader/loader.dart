import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/screens/home/home.dart';
import 'package:healify/ui/screens/loader/data.dart';
import 'package:healify/ui/screens/profile/CreateProfile.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/utils/colors.dart';
import 'package:rive/rive.dart';

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

  var randomInt = Random().nextInt(loadingMessages.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 300,
                  width: 200,
                  child: RiveAnimation.asset(
                    'assets/flameloader.riv',
                  )),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 15,
                      color: ColorTheme.darkgrey,
                      fontWeight: FontWeight.w700,
                    ),
                    "\"${loadingMessages[randomInt]}\""),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
