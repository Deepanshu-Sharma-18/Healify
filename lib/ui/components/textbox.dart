import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/utils/colors.dart';

class TextBox extends StatefulWidget {
  final TextEditingController controller;
  const TextBox({
    super.key,
    required this.controller,
  });

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 10,
      controller: widget.controller,
      style: GoogleFonts.dmSans(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
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
