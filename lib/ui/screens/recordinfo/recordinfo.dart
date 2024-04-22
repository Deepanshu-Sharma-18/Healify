import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/models/user.dart';
import 'package:healify/ui/components/bulletpoint.dart';
import 'package:healify/ui/components/showfile.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/presign.dart';
import 'package:healify/ui/screens/record/editrecord.dart';
import 'package:healify/utils/colors.dart';

class RecordInfo extends StatefulWidget {
  final String date;
  final String title;
  final List<dynamic>? symptoms;
  final List<dynamic>? diagnosis;
  final List<dynamic>? treatment;
  final List<Report>? reports;
  final String id;
  const RecordInfo(
      {super.key,
      required this.date,
      required this.title,
      this.symptoms,
      this.diagnosis,
      this.treatment,
      this.reports,
      required this.id});

  @override
  State<RecordInfo> createState() => _RecordInfoState();
}

class _RecordInfoState extends State<RecordInfo> {
  var presignController = Presign();

  var profileController = Get.find<ProfileController>();

  List<String> files = [];

  @override
  void initState() {
    super.initState();
    getFiles();
  }

  Future<void> getFiles() async {
    List<String> urls = [];
    for (var file in widget.reports!) {
      var response = await presignController.getDownloadPresignedUrl(
          profileController.profile!.data!.username!, file.objectKey!);
      urls.add(response.url!);
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
                                    records: widget.reports!),
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
                          Container(
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
                          if (i.toString().contains("image"))
                            CachedNetworkImage(
                              imageUrl: i,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
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
