import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healify/ui/components/recordcard.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/utils/colors.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
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
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Expanded(
                          child: RecordCard(
                            date: "13/13/13",
                            title: "title",
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
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Expanded(
                          child: RecordCard(
                            date: "13/13/13",
                            title: "title",
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
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Expanded(
                          child: RecordCard(
                            date: "13/13/13",
                            title: "title",
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
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Expanded(
                          child: RecordCard(
                            date: "13/13/13",
                            title: "title",
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
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Expanded(
                          child: RecordCard(
                            date: "13/13/13",
                            title: "title",
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
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Expanded(
                          child: RecordCard(
                            date: "13/13/13",
                            title: "title",
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

                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10),
                //   height: 100,
                //   width: double.infinity,
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           Container(
                //             height: 100,
                //             width: 5,
                //             color: Colors.black,
                //           ),
                //           const SizedBox(
                //             width: 10,
                //           ),
                //           RecordCard(
                //               date: "13/12/12",
                //               title: "Ggg",
                //               color: ColorTheme.grey),
                //         ],
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
