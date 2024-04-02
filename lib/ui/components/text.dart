import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final fontsize;
  final fontcolor;
  final fontweight;
  final text;

  MyText(
      {super.key, this.fontsize, this.fontcolor, this.fontweight, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.dmSans(
            fontSize: fontsize, color: fontcolor, fontWeight: fontweight));
  }
}
