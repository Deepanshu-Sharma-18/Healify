import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/screens/profile/profile.dart';
import 'package:healify/ui/screens/recordinfo/recordinfo.dart';
import 'package:healify/utils/colors.dart';

class RecordCard extends StatelessWidget {
  final String id;
  final String date;
  final String title;
  final Color color;
  const RecordCard(
      {super.key,
      required this.date,
      required this.title,
      required this.color,
      required this.id});

  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileController>();

    var list = profileController.profile!.data!.records!
        .firstWhere((element) => element.id == id);
    return InkWell(
      onTap: () => Get.to(
        () => RecordInfo(
            date: list.date!,
            title: list.title!,
            symptoms: list.symptoms ?? [],
            diagnosis: list.diagnosis ?? [],
            treatment: list.treatment ?? [],
            reports: list.reports ?? [],
            id: list.id!),
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  fontsize: 15,
                  fontcolor: ColorTheme.green,
                  fontweight: FontWeight.w700,
                  text: date.toString(),
                ),
                MyText(
                  fontsize: 18,
                  fontcolor: Colors.black,
                  fontweight: FontWeight.bold,
                  text: title,
                ),
              ],
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color == Colors.white ? ColorTheme.grey : Colors.white,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
