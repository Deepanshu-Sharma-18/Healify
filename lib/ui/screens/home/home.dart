import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/recordcard.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/record/record.dart';
import 'package:healify/ui/screens/timeline/timeline.dart';
import 'package:healify/utils/colors.dart';
import 'package:web3modal_flutter/widgets/w3m_account_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: ColorTheme.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(
                          fontsize: 20,
                          fontcolor: Colors.black,
                          fontweight: FontWeight.w700,
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
                    const SizedBox(
                      height: 10,
                    ),
                    RecordCard(
                      date: "13/13/13",
                      title: "Diabetes",
                      color: Colors.white,
                    ),
                    RecordCard(
                      date: "13/13/13",
                      title: "Diabetes",
                      color: Colors.white,
                    ),
                    RecordCard(
                      date: "13/13/13",
                      title: "Diabetes",
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => RecordScreen());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorTheme.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                                fontsize: 15,
                                fontcolor: Colors.black,
                                fontweight: FontWeight.w500,
                                text: "View all records"),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/images/chatgpt.jpg"),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: MyText(
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontweight: FontWeight.bold,
                              text: "Predict & Prevent any future disease",
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => Timeline());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage("assets/images/timeline.png"),
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                      MyText(
                        fontsize: 17,
                        fontcolor: Colors.black,
                        fontweight: FontWeight.w500,
                        text: "View your health timeline",
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
