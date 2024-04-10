import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/recordcard.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/record/addrecord.dart';
import 'package:healify/utils/colors.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.green,
        onPressed: () {
          Get.to(() => AddRecord());
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorTheme.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
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
                height: 10,
              ),
              MyText(
                fontsize: 30,
                fontcolor: Colors.black,
                fontweight: FontWeight.bold,
                text: "Manage Records",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    fontsize: 20,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.bold,
                    text: "Your Records",
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  MyText(
                    fontsize: 13,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w500,
                    text: "(25)",
                  ),
                ],
              ),
              for (int i = 0; i < 10; i++)
                RecordCard(
                  date: "13/13/13",
                  title: "Diabetes",
                  color: ColorTheme.grey,
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
