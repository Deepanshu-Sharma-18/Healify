import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/textfield.dart';
import 'package:healify/ui/screens/auth/auth.dart';
import 'package:healify/ui/screens/auth/signup.dart';
import 'package:healify/ui/screens/loader/loader.dart';
import 'package:healify/ui/screens/metamask/Login.dart';
import 'package:healify/utils/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  MyText(
                    text: "Sign In",
                    fontsize: 20,
                    fontweight: FontWeight.bold,
                    fontcolor: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyText(
                    text: "Create an account to get started",
                    fontsize: 15,
                    fontweight: FontWeight.w400,
                    fontcolor: Colors.black,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextfield(
                    controller: email,
                    hintText: "Enter email",
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => TextField(
                      obscureText: authController.isVisible.value,
                      controller: password,
                      style: GoogleFonts.dmSans(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            authController.isVisible.value =
                                !authController.isVisible.value;
                          },
                          icon: Icon(
                            authController.isVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorTheme.darkgrey,
                          ),
                        ),
                        hintStyle: const TextStyle(
                          color: ColorTheme.darkgrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        labelStyle: const TextStyle(
                          color: ColorTheme.darkgrey,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: ColorTheme.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(height: 2, color: ColorTheme.darkgrey),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        fontsize: 15,
                        fontcolor: Colors.black,
                        fontweight: FontWeight.w400,
                        text: "Don't have an account?",
                      ),
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(horizontal: 0),
                          ),
                        ),
                        onPressed: () {
                          Get.off(() => SignUp());
                        },
                        child: MyText(
                          text: "Sign Up",
                          fontcolor: ColorTheme.metamask,
                          fontsize: 15,
                          fontweight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        authController.signIn(email.text, password.text);
                        if (FirebaseAuth.instance.currentUser != null) {
                          Get.off(() => LoginMetamask());
                        }
                      } else {
                        Get.snackbar("Error", "Please fill all fields");
                      }
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
