import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/utils/colors.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const MyTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.dmSans(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorTheme.darkgrey,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          color: ColorTheme.darkgrey,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ColorTheme.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
