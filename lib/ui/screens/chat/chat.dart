import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/chat/gpt.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/utils/colors.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var gptController = GptController();
  var profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    gptController.getResults(profileController.profile.data!.records);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Color(0xff141414),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TopBar(),
              const SizedBox(
                height: 20,
              ),
              MyText(
                fontsize: 25,
                fontcolor: Colors.black,
                fontweight: FontWeight.bold,
                text: "AI Chat",
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.maxFinite,
                alignment: Alignment.centerRight,
                child: Container(
                  width: 300,
                  padding:
                      EdgeInsets.only(right: 0, top: 10, bottom: 10, left: 15),
                  decoration: BoxDecoration(
                    color: ColorTheme.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.start,
                    style: GoogleFonts.dmSans(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    "Analyze my records for predicting and prevention of any future disease.",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 350,
                  padding:
                      EdgeInsets.only(right: 0, top: 10, bottom: 10, left: 15),
                  decoration: BoxDecoration(
                    color: ColorTheme.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Obx(
                    () => Text(
                      textAlign: TextAlign.start,
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      gptController.answer == ""
                          ? "Thinking..."
                          : gptController.answer,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
