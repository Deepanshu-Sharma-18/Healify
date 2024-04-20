import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/recordcard.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/utils/colors.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  var profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  text: "Timeline",
                ),
                const SizedBox(
                  height: 20,
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
                              (index) => Stack(
                                children: [
                                  Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Expanded(
                                        child: RecordCard(
                                          id: profileController
                                              .profile!.data!.records![index].id
                                              .toString(),
                                          date: profileController.profile!.data!
                                              .records![index].date
                                              .toString(),
                                          title: profileController.profile!
                                              .data!.records![index].title
                                              .toString(),
                                          color: ColorTheme.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      height: 150,
                                      width: 5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 40,
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorTheme.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
