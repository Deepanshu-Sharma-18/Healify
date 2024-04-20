import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healify/models/responsepresign.dart';
import 'package:healify/ui/components/showfile.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/textfield.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/addpost.dart';
import 'package:healify/ui/screens/record/controller/post.dart';
import 'package:healify/ui/screens/record/controller/presign.dart';
import 'package:healify/utils/colors.dart';
import 'package:file_picker/file_picker.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileController>();

    var post = Post();
    var prsignController = Presign();

    var addPostController = AddPost();
    var title = TextEditingController();
    var symptoms = TextEditingController();
    var diagnosis = TextEditingController();
    var treatment = TextEditingController();

    DateTime? date = DateTime.now();

    Future<void> uploadRecords() async {}

    Future<void> savePost() async {
      if (title.text.isEmpty || date == null) {
        Get.snackbar("Failure", "Please fill the title");
        return;
      }
      Get.back();
      if (addPostController.records.isNotEmpty) {
        await addPostController.records.map(
          (element) async {
            PresignModel response;
            try {
              response = await prsignController.getUploadPresignedUrl(
                  profileController.profile!.data!.username!,
                  element.path.split("/").last);

              await prsignController.uploadFileToS3(response.url!, element);

              response = await prsignController.getDownloadPresignedUrl(
                  profileController.profile!.data!.username!,
                  element.path.split("/").last);

              addPostController.recordUrls.add(response.url!);
              print(addPostController.recordUrls);
            } catch (e) {
              Get.snackbar("Failure", "Failed to upload file. try again later");
            }
          },
        ).wait;
      }
      await post.saveReport(
          title.text,
          "${date!.day}/${date!.month}/${date!.year}",
          addPostController.symptoms,
          addPostController.diagnosis,
          addPostController.treatment,
          addPostController.recordUrls,
          profileController.profile!.data!.id!);

      await profileController
          .getProfile(FirebaseAuth.instance.currentUser!.uid!);
    }

    return Scaffold(
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
                    text: "Add Record",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    MyText(
                      fontsize: 20,
                      fontcolor: Colors.black,
                      fontweight: FontWeight.w800,
                      text: "Date",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ColorTheme.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  MyText(
                    fontsize: 17,
                    fontcolor: Colors.green,
                    fontweight: FontWeight.w700,
                    text: "${date!.day}/${date!.month}/${date!.year}",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyText(
                    fontsize: 20,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w800,
                    text: "Title",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextfield(
                    controller: title,
                    hintText: "Enter Title",
                    labelText: "Title",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyText(
                    fontsize: 20,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w800,
                    text: "Symptoms",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (var i in addPostController.symptoms)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: ColorTheme.green,
                                borderRadius: BorderRadius.circular(50),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                              fontsize: 15,
                              fontcolor: Colors.black,
                              fontweight: FontWeight.w500,
                              text: i),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              addPostController.symptoms.remove(i);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorTheme.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: ColorTheme.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!addPostController.symptoms.isEmpty)
                    const SizedBox(
                      height: 20,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: MyTextfield(
                            controller: symptoms,
                            hintText: "Enter Symptom",
                            labelText: "Symptom"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          addPostController.symptoms.add(symptoms.text);
                          symptoms.clear();
                        },
                        child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: ColorTheme.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyText(
                    fontsize: 20,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w800,
                    text: "Diagnosis",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (var i in addPostController.diagnosis)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: ColorTheme.green,
                                borderRadius: BorderRadius.circular(50),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                              fontsize: 15,
                              fontcolor: Colors.black,
                              fontweight: FontWeight.w500,
                              text: i),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              addPostController.diagnosis.remove(i);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorTheme.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: ColorTheme.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!addPostController.diagnosis.isEmpty)
                    const SizedBox(
                      height: 20,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: MyTextfield(
                            controller: diagnosis,
                            hintText: "Enter Diagnosis",
                            labelText: "Diagnosis"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          addPostController.diagnosis.add(diagnosis.text);
                          diagnosis.clear();
                        },
                        child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: ColorTheme.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyText(
                    fontsize: 20,
                    fontcolor: Colors.black,
                    fontweight: FontWeight.w800,
                    text: "Treatment",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (var i in addPostController.treatment)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: ColorTheme.green,
                                borderRadius: BorderRadius.circular(50),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                              fontsize: 15,
                              fontcolor: Colors.black,
                              fontweight: FontWeight.w500,
                              text: i),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              addPostController.treatment.remove(i);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorTheme.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: ColorTheme.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!addPostController.treatment.isEmpty)
                    const SizedBox(
                      height: 20,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: MyTextfield(
                            controller: treatment,
                            hintText: "Enter Treatment",
                            labelText: "Treatment"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          addPostController.treatment.add(treatment.text);
                          treatment.clear();
                        },
                        child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: ColorTheme.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      MyText(
                        fontsize: 20,
                        fontcolor: Colors.black,
                        fontweight: FontWeight.w800,
                        text: "Record File",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);

                          if (result != null) {
                            List<File> files = result.paths
                                .map((path) => File(path!))
                                .toList();
                            for (var file in files) {
                              addPostController.records.add(file);
                            }
                          } else {
                            // User canceled the picker
                          }
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorTheme.metamask),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          width: 120,
                          height: 20,
                          alignment: Alignment.center,
                          child: MyText(
                            text: "Upload Record",
                            fontcolor: Colors.black,
                            fontsize: 10,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                      childAspectRatio: 6.5 / 1.5,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: [
                        for (var file in addPostController.records)
                          FileCard(
                              fileName: file.path.split("/").last,
                              fileType: file.path.split(".").last)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      await savePost();
                      Get.back();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorTheme.metamask),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 60,
                      alignment: Alignment.center,
                      child: MyText(
                        text: "Save Record",
                        fontcolor: Colors.black,
                        fontsize: 17,
                        fontweight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
