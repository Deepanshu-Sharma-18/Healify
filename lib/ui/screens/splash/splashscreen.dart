import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/ui/screens/profile/CreateProfile.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(() => CreateProfile(), transition: Transition.fadeIn);
      });
    }

    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Welcome to Healify",
                  textStyle: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Welcome to Healify",
                  textStyle: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 77, 77, 77),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            AnimatedOpacity(
              opacity: 1,
              duration: const Duration(seconds: 2),
              child: Icon(
                Icons.medical_services,
                size: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ));
  }
}
