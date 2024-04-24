import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/models/record.dart';
import 'package:healify/repository/web3.dart';
import 'package:healify/ui/components/recordcard.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/post.dart';
import 'package:healify/utils/colors.dart';

class SharedRecord extends StatefulWidget {
  const SharedRecord({super.key});

  @override
  State<SharedRecord> createState() => _SharedRecordState();
}

class _SharedRecordState extends State<SharedRecord> {
  var profileController = Get.find<ProfileController>();
  var loginController = Get.find<LoginController>();

  // late var data;

  var web3 = Web3Controller();
  var post = Post();

  late var data;
  List<RecordModel> sharedRecords = [];

  Future<void> initWeb3() async {
    await web3.init();

    data = await web3.getSharedRecordsFromBlockchain(loginController.accountNo);

    print(data[0]);

    for (var i = 0; i < data[0].length; i++) {
      if (data[0][i] != null && data[0][i] != "") {
        print(data[0][i]);
        sharedRecords.add(await post.getRecord(data[0][i]));
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    initWeb3();
  }

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
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                sharedRecords.length,
                (index) => RecordCard(
                  id: sharedRecords[index].data!.id.toString(),
                  date: sharedRecords[index].data!.date.toString(),
                  title: sharedRecords[index].data!.title.toString(),
                  color: ColorTheme.grey,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
