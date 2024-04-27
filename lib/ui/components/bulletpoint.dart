import 'package:flutter/material.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/utils/colors.dart';

class BulletText extends StatelessWidget {
  final String text;
  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: ColorTheme.green,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MyText(
              fontsize: 17,
              fontcolor: Colors.black,
              fontweight: FontWeight.w500,
              text: text),
        ],
      ),
    );
  }
}
