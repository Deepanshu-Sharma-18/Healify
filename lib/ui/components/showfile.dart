import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/screens/record/controller/addpost.dart';
import 'package:healify/utils/colors.dart';

class FileCard extends StatelessWidget {
  FileCard(
      {super.key,
      required this.fileType,
      required this.fileName,
      required this.controller,
      required this.file});

  var controller;
  var file;
  final String fileName;
  final String fileType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.8),
        color: ColorTheme.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            fileType == "pdf" ? Icons.picture_as_pdf : Icons.image,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
            width: 100,
            child: Text(
              fileName,
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
              onTap: () {
                controller.records.remove(file);
              },
              child: Icon(Icons.delete, color: Colors.red, size: 20)),
        ],
      ),
    );
  }
}
