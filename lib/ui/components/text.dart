import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final double fontsize;
  final Color fontcolor;
  final FontWeight fontweight;
  final String text;

  MyText(
      {super.key,
      required this.fontsize,
      required this.fontcolor,
      required this.fontweight,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.dmSans(
            fontSize: fontsize, color: fontcolor, fontWeight: fontweight));
  }
}
