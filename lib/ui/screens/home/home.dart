import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/repository/bottomnav.dart';
import 'package:healify/repository/web3.dart';
import 'package:healify/ui/components/bottomnavigation.dart';
import 'package:healify/ui/components/recordcard.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/chat/chat.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/post.dart';
import 'package:healify/ui/screens/record/record.dart';
import 'package:healify/ui/screens/sharedrecords/sharedcontroller.dart';
import 'package:healify/ui/screens/sharedrecords/sharedrecords.dart';
import 'package:healify/ui/screens/timeline/timeline.dart';
import 'package:healify/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var loginController = Get.find<LoginController>();
  var profileController = Get.find<ProfileController>();
  var sharedController = Get.put(SharedController());
  var bottomNavController = Get.put(BottomNavController());

  @override
  void initState() {
    super.initState();
    initWeb3();
  }

  @override
  void dispose() {
    super.dispose();
    loginController.w3mService!.disconnect();
  }

  var web3 = Web3Controller();
  var post = Post();

  Future<void> initWeb3() async {
    await web3.init();

    print(loginController.accountNo);

    var data =
        await web3.getSharedRecordsFromBlockchain(loginController.accountNo);

    for (var i = 0; i < data[0].length; i++) {
      if (data[0][i] != null && data[0][i] != "") {
        sharedController.sharedRecords.add(await post.getRecord(data[0][i]));
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            width: double.infinity,
            child: profileController.isProfileNull
                ? Center(
                    child: Container(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: ColorTheme.green,
                      ),
                    ),
                  )
                : SingleChildScrollView(
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
                          text: "Home",
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
                                    text: "(" +
                                        profileController
                                            .profile!.data!.records!.length
                                            .toString()
                                            .removeAllWhitespace +
                                        ")",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              profileController
                                          .profile!.data!.records!.length ==
                                      0
                                  ? Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 50),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListView(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: List.generate(
                                            profileController.profile!.data!
                                                        .records!.length >
                                                    3
                                                ? 3
                                                : profileController.profile!
                                                    .data!.records!.length,
                                            (index) => RecordCard(
                                              id: profileController.profile!
                                                  .data!.records![index].id
                                                  .toString(),
                                              date: profileController.profile!
                                                  .data!.records![index].date
                                                  .toString(),
                                              title: profileController.profile!
                                                  .data!.records![index].title
                                                  .toString(),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                        InkWell(
                          onTap: () {
                            Get.to(() => ChatScreen());
                          },
                          child: Container(
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
                                  image:
                                      AssetImage("assets/images/chatgpt.jpg"),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: MyText(
                                          fontsize: 20,
                                          fontcolor: Colors.white,
                                          fontweight: FontWeight.bold,
                                          text:
                                              "Predict & Prevent any future disease",
                                        ),
                                      ),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                              color: ColorTheme.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/timeline.png"),
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
                                  ],
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
                        const SizedBox(
                          height: 30,
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
                                    text: "Shared Records",
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  MyText(
                                    fontsize: 13,
                                    fontcolor: Colors.black,
                                    fontweight: FontWeight.w500,
                                    text: "(" +
                                        sharedController.sharedRecords.length
                                            .toString()
                                            .removeAllWhitespace +
                                        ")",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              sharedController.sharedRecords.length == 0
                                  ? Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 50),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListView(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: List.generate(
                                            sharedController
                                                        .sharedRecords.length >
                                                    3
                                                ? 3
                                                : sharedController
                                                    .sharedRecords.length,
                                            (index) => RecordCard(
                                              id: sharedController
                                                  .sharedRecords[index].data!.id
                                                  .toString(),
                                              date: sharedController
                                                  .sharedRecords[index]
                                                  .data!
                                                  .date
                                                  .toString(),
                                              title: sharedController
                                                  .sharedRecords[index]
                                                  .data!
                                                  .title
                                                  .toString(),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 7,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => SharedRecord());
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                          height: 30,
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
