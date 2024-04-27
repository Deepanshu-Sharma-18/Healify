import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healify/models/record.dart';
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

  late var records = [];

  @override
  void initState() {
    super.initState();
    records = profileController.profile!.data!.records!;

    records.sort((a, b) {
      var a_day = a.date!.split("/").first;
      var a_month = a.date!.split("/")[1];
      var a_year = a.date!.split("/").last;

      var b_day = b.date!.split("/").first;
      var b_month = b.date!.split("/")[1];
      var b_year = b.date!.split("/").last;

      var a_date = "$a_year-$a_month-$a_day";
      var b_date = "$b_year-$b_month-$b_day";

      return a_date.compareTo(b_date);
    });
  }

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
                  fontsize: 25,
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
                                          id: records[index].id.toString(),
                                          date: records[index].date.toString(),
                                          title:
                                              records[index].title.toString(),
                                          color: ColorTheme.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      height: 150,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(
                                            index == 0 ||
                                                    index ==
                                                        profileController
                                                            .profile
                                                            .data!
                                                            .records!
                                                            .length
                                                ? 10
                                                : 0),
                                      ),
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
