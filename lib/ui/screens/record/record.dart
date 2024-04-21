import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/recordcard.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/addrecord.dart';
import 'package:healify/utils/colors.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  var profileController = Get.find<ProfileController>();

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
          child: Obx(
            () => Column(
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
                      text: "(" +
                          profileController.profile!.data!.records!.length
                              .toString()
                              .removeAllWhitespace +
                          ")",
                    ),
                  ],
                ),
                profileController.profile!.data!.records!.length == 0
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: Center(
                          child: MyText(
                            fontsize: 15,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.w500,
                            text: "No records found",
                          ),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(
                              profileController.profile!.data!.records!.length,
                              (index) => RecordCard(
                                id: profileController
                                    .profile!.data!.records![index].id
                                    .toString(),
                                date: profileController
                                    .profile!.data!.records![index].date
                                    .toString(),
                                title: profileController
                                    .profile!.data!.records![index].title
                                    .toString(),
                                color: ColorTheme.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
