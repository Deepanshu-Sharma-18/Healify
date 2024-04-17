import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/screens/auth/signin.dart';
import 'package:healify/ui/screens/profile/CreateProfile.dart';
import 'package:healify/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorTheme.green,
        child: AnimatedSplashScreen(
          backgroundColor: ColorTheme.green,
          splash: Center(
              child: MyText(
            fontcolor: Colors.black,
            fontsize: 30,
            text: 'Healify',
            fontweight: FontWeight.bold,
          )),
          nextScreen: FirebaseAuth.instance.currentUser != null
              ? CreateProfile()
              : SignIn(),
        ),
      ),
    );
  }
}
