import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/textfield.dart';
import 'package:healify/utils/colors.dart';
import 'package:orm/orm.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  void initState() {
    super.initState();
  }

  var height = TextEditingController();
  var age = TextEditingController();
  var weight = TextEditingController();
  var bloodGroup = TextEditingController();
  var gender = TextEditingController();

  Future<void> saveProfile() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                MyText(
                  text: "Create Profile",
                  fontsize: 20,
                  fontweight: FontWeight.bold,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                MyText(
                  text: "Help us to know you better",
                  fontsize: 15,
                  fontweight: FontWeight.w400,
                  fontcolor: Colors.black,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextfield(
                    controller: age,
                    hintText: "Enter your age",
                    labelText: "Age"),
                SizedBox(
                  height: 30,
                ),
                MyTextfield(
                    controller: gender,
                    hintText: "Enter your gender",
                    labelText: "Gender"),
                SizedBox(
                  height: 30,
                ),
                MyTextfield(
                    controller: weight,
                    hintText: "Enter your weight",
                    labelText: "Weight"),
                SizedBox(
                  height: 30,
                ),
                MyTextfield(
                    controller: height,
                    hintText: "Enter your height",
                    labelText: "Height"),
                SizedBox(
                  height: 30,
                ),
                MyTextfield(
                    controller: bloodGroup,
                    hintText: "Enter your blood group",
                    labelText: "Blood Group"),
                SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                  onPressed: () async {
                    await saveProfile();
                    // Get.off(() => LoginMetamask());
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorTheme.green),
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
                      text: "Proceed",
                      fontcolor: Colors.black,
                      fontsize: 17,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyText(
                            text: "Skip ",
                            fontcolor: ColorTheme.metamask,
                            fontsize: 15,
                            fontweight: FontWeight.bold,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: ColorTheme.metamask,
                            size: 20,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
