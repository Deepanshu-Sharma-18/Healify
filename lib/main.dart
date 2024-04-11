import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healify/repository/prismacontroller.dart';
import 'package:healify/ui/screens/auth/signup.dart';
import 'package:healify/ui/screens/home/home.dart';
import 'package:healify/ui/screens/metamask/Login.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:web3modal_flutter/constants/string_constants.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(PrismaController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: SignUp(),
    );
  }
}
