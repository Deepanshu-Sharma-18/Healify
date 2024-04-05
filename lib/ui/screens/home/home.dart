import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/utils/colors.dart';
import 'package:web3modal_flutter/widgets/w3m_account_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          TopBar(),
        ]),
      ),
    ));
  }
}
