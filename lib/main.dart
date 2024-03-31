import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginMetask(),
    );
  }
}

class LoginMetask extends StatefulWidget {
  const LoginMetask({super.key});

  @override
  State<LoginMetask> createState() => _LoginMetaskState();
}

class _LoginMetaskState extends State<LoginMetask> {
  late ContractFunction addPatient;
  late ContractFunction addRecord;
  var chainId = "11155111";
  var contractAddress = "0x94791C982a6d132D5E547a563aE038243C2e6A9F";
  late ContractFunction deleteRecord;
  late ContractFunction getPatientsRecords;
  late ContractFunction grantAccess;
  late ContractFunction revokeAccess;
  final sepoliaChain = W3MChainInfo(
    chainName: 'Sepolia',
    chainId: "11155111",
    namespace: 'eip155:11155111',
    tokenName: 'ETH',
    rpcUrl: 'https://rpc.sepolia.org/',
    blockExplorer: W3MBlockExplorer(
        name: 'Sepolia Explorer', url: 'https://sepolia.etherscan.io/'),
  );

  late ContractAbi _abiCode;
  late Credentials _cred;
  late DeployedContract _deployedContract;
  EthPrivateKey? _privateKey;
  W3MService? _w3mService;
  late Web3Client _web3client;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    W3MChainPresets.chains.putIfAbsent(chainId, () => sepoliaChain);
    _w3mService = W3MService(
      projectId: '23cba4bca496679312a92ad6a7207a86',
      metadata: const PairingMetadata(
        name: 'Web3Modal Flutter Example',
        description: 'Web3Modal Flutter Example',
        url: 'https://www.walletconnect.com/',
        icons: ['https://walletconnect.com/walletconnect-logo.png'],
        redirect: Redirect(
          native: 'flutterdapp://', // your own custom scheme
          universal: 'https://www.walletconnect.com',
        ),
      ),
    );
    await _w3mService!.init();
  }

  Future<void> callReadFunction() async {
    const rpcUrl =
        'https://sepolia.infura.io/v3/c53a21fae8f64a08ae380e76ecf0c18d';

    const socket =
        "wss://sepolia.infura.io/ws/v3/c53a21fae8f64a08ae380e76ecf0c18d";

    _privateKey = EthPrivateKey.fromHex(
        "f27d158ea0c056b026c8805c19e22466bb69914104880a1f07c2f6cfd77f52eb");

    _cred = _privateKey!;

    String abiFile = await rootBundle.loadString('assets/HealthRecords.json');

    var jsonAbi = jsonDecode(abiFile);

    _abiCode =
        ContractAbi.fromJson(jsonEncode(jsonAbi["abi"]), 'HealthRecords');

    _web3client = Web3Client(
      rpcUrl,
      http.Client(),
    );

    _deployedContract =
        DeployedContract(_abiCode, EthereumAddress.fromHex(contractAddress));

    addPatient = _deployedContract.function('addPatient');
    addRecord = _deployedContract.function('addRecord');
    deleteRecord = _deployedContract.function('deleteRecord');
    getPatientsRecords = _deployedContract.function('getPatientsRecords');
    grantAccess = _deployedContract.function('grantAccess');
    revokeAccess = _deployedContract.function('revokeAccess');

    // await _web3client.sendTransaction(
    //   _cred,
    //   Transaction.callContract(
    //       contract: _deployedContract,
    //       function: addPatient,
    //       parameters: ["deepanshu"]),
    //   chainId: 11155111,
    // );

    // await _web3client.sendTransaction(
    //   _cred,
    //   Transaction.callContract(
    //       contract: _deployedContract,
    //       function: addRecord,
    //       parameters: ["deepanshu", "dc1"]),
    //   chainId: 11155111,
    // );
    // await _web3client.sendTransaction(
    //   _cred,
    //   Transaction.callContract(
    //       contract: _deployedContract,
    //       function: grantAccess,
    //       parameters: [
    //         "deepanshu",
    //         "dc1",
    //         EthereumAddress.fromHex(
    //             "0x94791C982a6d132D5E547a563aE038243C2e6A9F")
    //       ]),
    //   chainId: 11155111,
    // );

    final data = await _web3client.call(
        contract: _deployedContract,
        function: getPatientsRecords,
        params: ["deepanshu", "dc1"]);

    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _w3mService == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  W3MConnectWalletButton(service: _w3mService!),
                  const SizedBox(height: 20),
                  W3MNetworkSelectButton(service: _w3mService!),
                  const SizedBox(height: 20),
                  W3MAccountButton(service: _w3mService!),
                  OutlinedButton(
                      onPressed: () {
                        callReadFunction();
                      },
                      child: Text("Test call contract"))
                ],
              ),
      ),
    );
  }
}
