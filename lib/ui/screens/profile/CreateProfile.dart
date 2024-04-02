import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healify/ui/components/text.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  var height = TextEditingController();
  var age = TextEditingController();
  var weight = TextEditingController();
  var bloodGroup = TextEditingController();
  var gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 50,
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
          TextField(
            controller: age,
            decoration: InputDecoration(
              hintText: "Enter your name",
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          TextField(
            controller: height,
            decoration: InputDecoration(
              hintText: "Enter your name",
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
