import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:healify/models/user.dart';
import 'package:healify/repository/web3.dart';
import 'package:healify/ui/components/bulletpoint.dart';
import 'package:healify/ui/components/showfile.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/textfield.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/presign.dart';
import 'package:healify/ui/screens/record/editrecord.dart';
import 'package:healify/utils/colors.dart';
import 'package:http/http.dart' as http;

class RecordInfo extends StatefulWidget {
  const RecordInfo(
      {super.key,
      required this.date,
      required this.title,
      this.symptoms,
      this.diagnosis,
      this.treatment,
      this.reports,
      required this.id});

  final String date;
  final List<dynamic>? diagnosis;
  final String id;
  final List<Report>? reports;
  final List<dynamic>? symptoms;
  final String title;
  final List<dynamic>? treatment;

  @override
  State<RecordInfo> createState() => _RecordInfoState();
}

class _RecordInfoState extends State<RecordInfo> {
  List<String> files = [];
  List<String> sharedWith = [];
  var presignController = Presign();
  var profileController = Get.find<ProfileController>();
  var share = TextEditingController();
  var web3controller = Get.find<Web3Controller>();

  @override
  void initState() {
    super.initState();
    getFiles();
    sharedRecordWith();
  }

  Future<void> sharedRecordWith() async {
    var data = await web3controller.getPatientRecordsFromBlockchain(
        profileController.profile!.data!.authId!, widget.id);

    for (var i = 0; i < data[0][0].length; i++) {
      sharedWith.add(data[0][0][i].toString());
    }

    setState(() {});
  }

  Future<void> getFiles() async {
    List<String> urls = [];
    for (var file in widget.reports!) {
      var response = await presignController.getDownloadPresignedUrl(
          profileController.profile!.data!.username!, file.objectKey!);

      if (response.url!.contains("pdf")) {
        final pdf = await http.get(Uri.parse(response.url!));
        if (pdf.statusCode == 200) {
          final tempDir = Directory.systemTemp;
          final filePath = tempDir.path + "/" + file.objectKey!;
          final pdfFile = File(filePath);
          await pdfFile.writeAsBytes(pdf.bodyBytes);

          urls.add(pdfFile.path);
        } else {
          print("Error downloading PDF: ${pdf.body}");
        }
      } else {
        urls.add(response.url!);
      }
    }

    setState(() {
      files = urls;
    });

    print(files);
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
                  fontsize: 30,
                  fontcolor: Colors.black,
                  fontweight: FontWeight.bold,
                  text: "Manage Records",
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            fontsize: 15,
                            fontcolor: ColorTheme.green,
                            fontweight: FontWeight.bold,
                            text: widget.date,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MyText(
                            fontsize: 25,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.bold,
                            text: widget.title,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => EditRecord(
                                    id: widget.id,
                                    date: widget.date,
                                    title: widget.title,
                                    symptoms: widget.symptoms ?? [],
                                    diagnosis: widget.diagnosis ?? [],
                                    treatment: widget.treatment ?? [],
                                    records: widget.reports ?? []),
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: ColorTheme.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              await Get.bottomSheet(
                                Container(
                                  height: 600,
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      MyText(
                                        fontsize: 20,
                                        fontcolor: ColorTheme.metamask,
                                        fontweight: FontWeight.bold,
                                        text: "Share Record",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      MyText(
                                        fontsize: 15,
                                        fontcolor: ColorTheme.green,
                                        fontweight: FontWeight.bold,
                                        text: "Share with",
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MyTextfield(
                                        hintText: "Enter Address",
                                        controller: share,
                                        labelText: "Address",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {
                                          share.clear();
                                          Get.back();

                                          await web3controller
                                              .grantAccessFromBlockchain(
                                                  profileController
                                                      .profile!.data!.authId!,
                                                  widget.id,
                                                  "0x5F1Ea3acAa2C70a936E2066AC285eB0e30D22e9c");
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorTheme.metamask),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width: double.infinity,
                                          height: 60,
                                          alignment: Alignment.center,
                                          child: MyText(
                                            text: "Share Record",
                                            fontcolor: Colors.black,
                                            fontsize: 17,
                                            fontweight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      MyText(
                                        fontsize: 15,
                                        fontcolor: ColorTheme.green,
                                        fontweight: FontWeight.bold,
                                        text: "Shared with",
                                      ),
                                      ListView(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            sharedWith.length,
                                            (index) => Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 4),
                                                  width: double.maxFinite,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 330,
                                                        child: Text(
                                                          sharedWith[index],
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          sharedWith.remove(
                                                              sharedWith[
                                                                  index]);
                                                          setState(() {});
                                                          await web3controller
                                                              .revokeAccessFromBlockchain(
                                                                  profileController
                                                                      .profile!
                                                                      .data!
                                                                      .authId!,
                                                                  widget.id,
                                                                  sharedWith[
                                                                      index]);
                                                        },
                                                        child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorTheme
                                                                .metamask,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Icon(
                                                            Icons.delete,
                                                            color: Colors.white,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: ColorTheme.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorTheme.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyText(
                            fontsize: 20,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.bold,
                            text: "Symptoms",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MyText(
                            fontsize: 13,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.w500,
                            text:
                                "(${widget.symptoms != null ? widget.symptoms!.length.toString() : "0"})",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (widget.symptoms != null)
                              for (var i in widget.symptoms!)
                                BulletText(
                                  text: i,
                                ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorTheme.orange,
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
                            fontweight: FontWeight.bold,
                            text: "Diagnosis",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MyText(
                            fontsize: 13,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.w500,
                            text:
                                "(${widget.diagnosis != null ? widget.diagnosis!.length.toString() : "0"})",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (widget.diagnosis != null)
                              for (var i in widget.diagnosis!)
                                BulletText(
                                  text: i,
                                ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorTheme.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyText(
                            fontsize: 20,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.bold,
                            text: "Treatment",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MyText(
                            fontsize: 13,
                            fontcolor: Colors.black,
                            fontweight: FontWeight.w500,
                            text:
                                "(${widget.treatment != null ? widget.treatment!.length.toString() : "0"})",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (widget.treatment != null)
                              for (var i in widget.treatment!)
                                BulletText(
                                  text: i,
                                ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyText(
                  fontsize: 20,
                  fontcolor: Colors.black,
                  fontweight: FontWeight.bold,
                  text: "Reports",
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: GridView.count(
                    padding: const EdgeInsets.all(5),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.5 / 1.5,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      if (files != null)
                        for (var i in files)
                          i.toString().contains("image")
                              ? CachedNetworkImage(
                                  imageUrl: i,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )
                              : PDFView(
                                  filePath: i.toString(),
                                )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
