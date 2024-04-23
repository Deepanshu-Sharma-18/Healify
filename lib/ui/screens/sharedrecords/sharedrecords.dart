import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/profile/profile.dart';

class SharedRecord extends StatefulWidget {
  const SharedRecord({super.key});

  @override
  State<SharedRecord> createState() => _SharedRecordState();
}

class _SharedRecordState extends State<SharedRecord> {
  var profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TopBar(),
            const SizedBox(
              height: 10,
            ),
            MyText(
              fontsize: 30,
              fontcolor: Colors.black,
              fontweight: FontWeight.bold,
              text: "Shared Records",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
