import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/models/responsepresign.dart';
import 'package:healify/models/user.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/textfield.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/record/controller/editpost.dart';
import 'package:healify/ui/screens/record/controller/post.dart';
import 'package:healify/ui/screens/record/controller/presign.dart';
import 'package:healify/utils/colors.dart';

class EditRecord extends StatefulWidget {
  final String date;
  final String title;
  final List<dynamic>? symptoms;
  final List<dynamic>? diagnosis;
  final List<dynamic>? treatment;
  final List<Report>? records;
  final String id;

  const EditRecord(
      {super.key,
      required this.date,
      required this.title,
      required this.symptoms,
      required this.diagnosis,
      required this.treatment,
      required this.records,
      required this.id});

  @override
  State<EditRecord> createState() => _EditRecordState();
}

class _EditRecordState extends State<EditRecord> {
  var profileController = Get.find<ProfileController>();
  var loginController = Get.find<LoginController>();

  var post = Post();
  var prsignController = Presign();

  var editPostController = Get.put(EditPost());
  late TextEditingController title;
  var symptoms = TextEditingController();
  var diagnosis = TextEditingController();
  var treatment = TextEditingController();

  @override
  void initState() {
    super.initState();

    title = TextEditingController(text: widget.title);

    editPostController.updateLists(
        widget.symptoms?.cast<String>(),
        widget.diagnosis?.cast<String>(),
        widget.treatment?.cast<String>(),
        widget.records);

    var day = widget.date.split("/").first;
    var year = widget.date.split("/").last;
    var month = widget.date.split("/")[1];

    if (month.length == 1) month = "0$month";
    if (day.length == 1) day = "0$day";

    editPostController.date.value = DateTime.parse("$year-$month-$day");
  }

  Future<void> deleteRecord() async {
    await Get.bottomSheet(Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MyText(
              fontsize: 15,
              fontcolor: ColorTheme.green,
              fontweight: FontWeight.w500,
              text: "Delete Record"),
          const SizedBox(
            height: 20,
          ),
          MyText(
              fontsize: 15,
              fontcolor: Colors.black,
              fontweight: FontWeight.w500,
              text: "Are you sure?"),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () async {
              Get.back();
              Get.back();
              Get.back();
              await post.deleteRecord(widget.id);

              await profileController.getProfile(
                  loginController.accountNo.toString().toLowerCase());
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
              width: double.maxFinite,
              height: 60,
              alignment: Alignment.center,
              child: MyText(
                text: "Delete",
                fontcolor: Colors.black,
                fontsize: 17,
                fontweight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: MyText(
                  fontsize: 10,
                  fontcolor: ColorTheme.green,
                  fontweight: FontWeight.w500,
                  text: "Cancel"),
            ),
          )
        ],
      ),
    ));
  }

  Future<void> updateRecord() async {
    if (title.text.isEmpty) {
      Get.snackbar("Failure", "Please fill the title");
      return;
    }

    Get.back();
    if (editPostController.newrecords.isNotEmpty) {
      await editPostController.newrecords.map(
        (element) async {
          PresignModel response;
          try {
            response = await prsignController.getUploadPresignedUrl(
                profileController.profile!.data!.username!,
                element.path.split("/").last);

            await prsignController.uploadFileToS3(response.url!, element);
          } catch (e) {
            Get.snackbar("Failure", "Failed to upload file. try again later");
          }
        },
      ).wait;
    }

    await post.updateRecord(
        widget.id,
        title.text,
        "${editPostController.date.value.day}/${editPostController.date.value.month}/${editPostController.date.value.year}",
        editPostController.symptoms,
        editPostController.diagnosis,
        editPostController.treatment,
        editPostController.filesToUpload,
        profileController.profile!.data!.id!);

    await profileController.getProfile(FirebaseAuth.instance.currentUser!.uid!);
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(
                          fontsize: 30,
                          fontcolor: Colors.black,
                          fontweight: FontWeight.bold,
                          text: "Edit Record",
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Container(
                          child: OutlinedButton(
                            onPressed: () async {
                              await deleteRecord();
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(0)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorTheme.metamask),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 80,
                                height: 15,
                                alignment: Alignment.center,
                                child: MyText(
                                  text: "Delete",
                                  fontcolor: Colors.black,
                                  fontsize: 13,
                                  fontweight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
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
                        editPostController.date.value = (await showDatePicker(
                          context: context,
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                        ))!;
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
                    text:
                        "${editPostController.date.value.day}/${editPostController.date.value.month}/${editPostController.date.value.year}",
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
                  for (var i in editPostController.symptoms)
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
                              editPostController.symptoms.remove(i);
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
                  if (!editPostController.symptoms.isEmpty)
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
                          editPostController.symptoms.add(symptoms.text);
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
                  for (var i in editPostController.diagnosis)
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
                              editPostController.diagnosis.remove(i);
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
                  if (!editPostController.diagnosis.isEmpty)
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
                          editPostController.diagnosis.add(diagnosis.text);
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
                  for (var i in editPostController.treatment)
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
                              editPostController.treatment.remove(i);
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
                  if (!editPostController.treatment.isEmpty)
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
                          editPostController.treatment.add(treatment.text);
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
                  MyText(
                    fontsize: 10,
                    fontcolor: ColorTheme.metamask,
                    fontweight: FontWeight.w500,
                    text:
                        "*Report files are not editable. You can only delete them. If you want to add or edit a report file, please create a new record.",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      await updateRecord();
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
