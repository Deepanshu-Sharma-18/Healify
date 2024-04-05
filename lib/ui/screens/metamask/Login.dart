import 'dart:convert';
import 'package:get/get.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loginController.initialize();
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
        child: loginController.w3mService == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  W3MConnectWalletButton(service: loginController.w3mService!),
                  const SizedBox(height: 20),
                  W3MNetworkSelectButton(service: loginController.w3mService!),
                  const SizedBox(height: 20),
                  W3MAccountButton(service: loginController.w3mService!),
                ],
              ),
      ),
    );
  }
}
