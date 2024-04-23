import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/components/topbar.dart';
import 'package:healify/ui/screens/home/home.dart';
import 'package:healify/ui/screens/loader/loader.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class LoginMetamask extends StatefulWidget {
  const LoginMetamask({super.key});

  @override
  State<LoginMetamask> createState() => _LoginMetaskState();
}

class _LoginMetaskState extends State<LoginMetamask> {
  var loginController = Get.find<LoginController>();

  Timer? timer;

  @override
  void initState() {
    super.initState();
    loginController.initialize();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (loginController.w3mService != null) {
        Get.off(() => LoadingScreen());
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TopBar(),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://thegivingblock.com/wp-content/uploads/2023/02/MetaMask-Partnership-The-Giving-Block.png"),
                  )),
            ),
            Container(
              width: 200,
              height: 50,
              child: W3MNetworkSelectButton(
                service: loginController.w3mService!,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(21),
              ),
              child: W3MConnectWalletButton(
                service: loginController.w3mService!,
                size: BaseButtonSize.regular,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }
}
