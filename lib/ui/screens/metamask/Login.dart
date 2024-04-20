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

  // Future<void> callReadFunction() async {
  //   const rpcUrl =
  //       'https://sepolia.infura.io/v3/c53a21fae8f64a08ae380e76ecf0c18d';

  //   const socket =
  //       "wss://sepolia.infura.io/ws/v3/c53a21fae8f64a08ae380e76ecf0c18d";

  //   _privateKey = EthPrivateKey.fromHex(
  //       "f27d158ea0c056b026c8805c19e22466bb69914104880a1f07c2f6cfd77f52eb");

  //   _cred = _privateKey!;

  //   String abiFile = await rootBundle.loadString('assets/HealthRecords.json');

  //   var jsonAbi = jsonDecode(abiFile);

  //   _abiCode =
  //       ContractAbi.fromJson(jsonEncode(jsonAbi["abi"]), 'HealthRecords');

  //   _web3client = Web3Client(
  //     rpcUrl,
  //     http.Client(),
  //   );

  //   _deployedContract =
  //       DeployedContract(_abiCode, EthereumAddress.fromHex(contractAddress));

  //   addPatient = _deployedContract.function('addPatient');
  //   addRecord = _deployedContract.function('addRecord');
  //   deleteRecord = _deployedContract.function('deleteRecord');
  //   getPatientsRecords = _deployedContract.function('getPatientsRecords');
  //   grantAccess = _deployedContract.function('grantAccess');
  //   revokeAccess = _deployedContract.function('revokeAccess');

  //   final data = await _web3client.call(
  //       contract: _deployedContract,
  //       function: getPatientsRecords,
  //       params: ["deepanshu", "dc1"]);

  //   print(data.toString());
  // }

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
            // Visibility(
            //   visible: loginController.w3mService != null &&
            //       loginController.w3mService!.isConnected == true,
            //   child: OutlinedButton(
            //     onPressed: () {
            //       Get.off(() => LoadingScreen());
            //     },
            //     style: ButtonStyle(
            //       backgroundColor:
            //           MaterialStateProperty.all<Color>(ColorTheme.green),
            //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //       ),
            //     ),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(horizontal: 20),
            //       width: double.infinity,
            //       height: 60,
            //       alignment: Alignment.center,
            //       child: MyText(
            //         text: "Proceed",
            //         fontcolor: Colors.black,
            //         fontsize: 17,
            //         fontweight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
