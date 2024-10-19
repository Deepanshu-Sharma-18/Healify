import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/models/user.dart';
import 'package:healify/repository/web3.dart';
import 'package:healify/ui/components/bulletpoint.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/textfield.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/post.dart';
import 'package:healify/ui/screens/record/controller/presign.dart';
import 'package:healify/ui/screens/record/editrecord.dart';
import 'package:healify/ui/screens/recordinfo/sharedcontroller.dart';
import 'package:healify/ui/screens/sharedrecords/sharedcontroller.dart';
import 'package:healify/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

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
  var web3 = Web3Controller();
  var post = Post();
  List<String> files = [];
  var presignController = Presign();
  var profileController = Get.find<ProfileController>();
  var share = TextEditingController();
  var sharedController = SharedRecordsController();
  var shareController = SharedController();
  var web3controller = Get.find<Web3Controller>();
  var loginController = Get.find<LoginController>();

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
      sharedController.sharedWith.add(data[0][0][i].toString());
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
                            fontsize: 20,
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
                              width: 85,
                              decoration: BoxDecoration(
                                color: ColorTheme.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  MyText(
                                    fontsize: 16,
                                    fontcolor: Colors.black,
                                    fontweight: FontWeight.w600,
                                    text: "Edit",
                                  ),
                                ],
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
                                        fontcolor: Colors.black,
                                        fontweight: FontWeight.bold,
                                        text: "Share Record",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      MyText(
                                        fontsize: 17,
                                        fontcolor: Colors.black,
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
                                          Get.back();

                                          await web3controller
                                              .grantAccessFromBlockchain(
                                                  profileController
                                                      .profile!.data!.authId!,
                                                  widget.id,
                                                  share.text);
                                          share.clear();
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
                                      Row(
                                        children: [
                                          MyText(
                                            fontsize: 17,
                                            fontcolor: Colors.black,
                                            fontweight: FontWeight.bold,
                                            text: "Records Shared with Users",
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          MyText(
                                            fontsize: 13,
                                            fontcolor: Colors.black,
                                            fontweight: FontWeight.bold,
                                            text:
                                                "(${sharedController.sharedWith.length})",
                                          ),
                                        ],
                                      ),
                                      Obx(
                                        () => sharedController
                                                    .sharedWith.length >
                                                0
                                            ? ListView(
                                                shrinkWrap: true,
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                children: List.generate(
                                                  sharedController
                                                      .sharedWith.length,
                                                  (index) => Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4),
                                                    width: double.maxFinite,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 330,
                                                          child: Text(
                                                            sharedController
                                                                    .sharedWith[
                                                                index],
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.black,
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
                                                            sharedController
                                                                .sharedWith
                                                                .remove(sharedController
                                                                        .sharedWith[
                                                                    index]);

                                                            await web3controller
                                                                .revokeAccessFromBlockchain(
                                                                    profileController
                                                                        .profile!
                                                                        .data!
                                                                        .authId!,
                                                                    widget.id,
                                                                    sharedController
                                                                            .sharedWith[
                                                                        index]);

                                                            var data = await web3
                                                                .getSharedRecordsFromBlockchain(
                                                                    loginController
                                                                        .accountNo);

                                                            for (var i = 0;
                                                                i <
                                                                    data[0]
                                                                        .length;
                                                                i++) {
                                                              if (data[0][i] !=
                                                                      null &&
                                                                  data[0][i] !=
                                                                      "") {
                                                                shareController
                                                                    .sharedRecords
                                                                    .add(await post
                                                                        .getRecord(data[0]
                                                                            [
                                                                            i]));
                                                              }
                                                            }
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
                                                              color:
                                                                  Colors.white,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  MyText(
                                                      fontsize: 15,
                                                      fontcolor:
                                                          ColorTheme.darkgrey,
                                                      fontweight:
                                                          FontWeight.w500,
                                                      text: "No users found"),
                                                ],
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 95,
                              decoration: BoxDecoration(
                                color: ColorTheme.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  MyText(
                                      fontsize: 16,
                                      fontcolor: Colors.black,
                                      fontweight: FontWeight.w600,
                                      text: "Share"),
                                ],
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
                    color: ColorTheme.grey,
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
                  child: files.length > 0
                      ? GridView.count(
                          padding: const EdgeInsets.all(5),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 4.5 / 1.5,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: [
                            if (widget.reports != null)
                              for (var f = 0; f < widget.reports!.length; f++)
                                InkWell(
                                  onTap: () async {
                                    final Completer<PDFViewController>
                                        _controller =
                                        Completer<PDFViewController>();
                                    int? pages = 0;
                                    int? currentPage = 0;
                                    bool isReady = false;
                                    String errorMessage = '';
                                    await Get.bottomSheet(
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent),
                                        child: files[f]
                                                .toString()
                                                .contains("image")
                                            ? PhotoView(
                                                imageProvider:
                                                    NetworkImage(files[f]),
                                              )
                                            : PDFView(
                                                filePath: files[f],
                                                enableSwipe: true,
                                                swipeHorizontal: true,
                                                autoSpacing: false,
                                                pageFling: true,
                                                pageSnap: true,
                                                defaultPage: currentPage!,
                                                fitPolicy: FitPolicy.BOTH,
                                                preventLinkNavigation:
                                                    false, // if set to true the link is handled in flutter
                                                onRender: (_pages) {
                                                  setState(() {
                                                    pages = _pages;
                                                    isReady = true;
                                                  });
                                                },
                                                onError: (error) {
                                                  setState(() {
                                                    errorMessage =
                                                        error.toString();
                                                  });
                                                },
                                                onPageError: (page, error) {
                                                  setState(() {
                                                    errorMessage =
                                                        '$page: ${error.toString()}';
                                                  });
                                                },
                                                onViewCreated:
                                                    (PDFViewController
                                                        pdfViewController) {
                                                  _controller.complete(
                                                      pdfViewController);
                                                },
                                                onLinkHandler: (String? uri) {},
                                                onPageChanged:
                                                    (int? page, int? total) {
                                                  setState(() {
                                                    currentPage = page;
                                                  });
                                                },
                                              ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.8),
                                      color: ColorTheme.grey,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          widget.reports![f].content!
                                                      .split("/")
                                                      .last ==
                                                  "pdf"
                                              ? Icons.picture_as_pdf
                                              : Icons.image,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text(
                                            widget.reports![f].objectKey!
                                                .split(".")
                                                .first,
                                            style: GoogleFonts.dmSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          ],
                        )
                      : widget.reports!.length > 0
                          ? Center(
                              child: Container(
                                child: MyText(
                                  fontsize: 15,
                                  fontcolor: Colors.black,
                                  fontweight: FontWeight.w600,
                                  text: "Loading...",
                                ),
                              ),
                            )
                          : Center(
                              child: Container(
                                child: MyText(
                                  fontsize: 15,
                                  fontcolor: Colors.black,
                                  fontweight: FontWeight.w600,
                                  text: "No records found",
                                ),
                              ),
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
