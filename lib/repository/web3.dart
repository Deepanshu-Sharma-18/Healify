import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healify/utils/constants.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:http/http.dart' as http;

class Web3Controller extends GetxController {
  late ContractAbi _abiCode;
  late DeployedContract _deployedContract;

  EthPrivateKey _privateKey = PrivateKey;
  Credentials _cred = PrivateKey;

  final String socketUrl = SocketUrl;
  final String rpcUrl = RpcUrl;

  late ContractFunction addPatient;
  late ContractFunction addRecord;
  late ContractFunction deleteRecord;
  late ContractFunction getPatientsRecords;
  late ContractFunction grantAccess;
  late ContractFunction revokeAccess;
  late ContractFunction getsharedRecords;

  late Web3Client web3client;

  init() async {
    String abiFile = await rootBundle.loadString('assets/HealthRecords.json');

    var jsonAbi = jsonDecode(abiFile);

    _abiCode =
        ContractAbi.fromJson(jsonEncode(jsonAbi["abi"]), 'HealthRecords');

    web3client = Web3Client(
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
    getsharedRecords = _deployedContract.function('getsharedRecords');
  }

  Future<void> getSharedRecordsFromBlockchain(String address) async {
    final _address = EthereumAddress.fromHex(address);
    final data = await web3client.call(
        contract: _deployedContract,
        function: getsharedRecords,
        params: [_address]);

    print(data.toString());
  }

  Future<void> getPatientRecordsFromBlockchain(
      String authid, String documentid) async {
    final data = await web3client.call(
        contract: _deployedContract,
        function: getPatientsRecords,
        params: [authid, documentid]);

    print(data.toString());
  }

  Future<void> addPatientFromBlockchain(String authid) async {
    final data = await web3client.call(
        contract: _deployedContract, function: addPatient, params: [authid]);

    print(data.toString());
  }

  Future<void> addRecordFromBlockchain(String authid, String documentid) async {
    final data = await web3client.call(
        contract: _deployedContract,
        function: addRecord,
        params: [authid, documentid]);

    print(data.toString());
  }

  Future<void> deleteRecordFromBlockchain(
      String authid, String documentid, List<String> address) async {
    final ethAddress = address.map((e) => EthereumAddress.fromHex(e)).toList();
    final data = await web3client.call(
        contract: _deployedContract,
        function: deleteRecord,
        params: [authid, documentid, ethAddress]);

    print(data.toString());
  }

  Future<void> grantAccessFromBlockchain(
      String authid, String documentid, String address) async {
    final ethAddress = EthereumAddress.fromHex(address);
    final data = await web3client.call(
        contract: _deployedContract,
        function: grantAccess,
        params: [authid, documentid, ethAddress]);

    print(data.toString());
  }

  Future<void> revokeAccessFromBlockchain(
      String authid, String documentid, String address) async {
    final ethAddress = EthereumAddress.fromHex(address);
    final data = await web3client.call(
        contract: _deployedContract,
        function: revokeAccess,
        params: [authid, documentid, ethAddress]);

    print(data.toString());
  }
}
