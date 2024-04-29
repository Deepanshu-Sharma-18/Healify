import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healify/env/env.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class Web3Controller extends GetxController {
  late ContractFunction addPatient;
  late ContractFunction addRecord;
  late ContractFunction deleteRecord;
  late ContractFunction getPatientsRecords;
  late ContractFunction getsharedRecords;
  late ContractFunction grantAccess;
  late ContractFunction revokeAccess;
  final String rpcUrl = Env.RpcUrl;
  final String socketUrl = Env.SocketUrl;
  late Web3Client web3client;

  late ContractAbi _abiCode;
  Credentials _cred = EthPrivateKey.fromHex(Env.PrivateKey);
  late DeployedContract _deployedContract;
  EthPrivateKey _privateKey = EthPrivateKey.fromHex(Env.PrivateKey);

  init() async {
    String abiFile = await rootBundle.loadString('assets/HealthRecords.json');

    var jsonAbi = jsonDecode(abiFile);

    _abiCode =
        ContractAbi.fromJson(jsonEncode(jsonAbi["abi"]), 'HealthRecords');

    web3client = Web3Client(
      rpcUrl,
      http.Client(),
    );

    _deployedContract = DeployedContract(
        _abiCode, EthereumAddress.fromHex(Env.ContractAddress));

    addPatient = _deployedContract.function('addPatient');
    addRecord = _deployedContract.function('addRecord');
    deleteRecord = _deployedContract.function('deleteRecord');
    getPatientsRecords = _deployedContract.function('getPatientsRecords');
    grantAccess = _deployedContract.function('grantAccess');
    revokeAccess = _deployedContract.function('revokeAccess');
    getsharedRecords = _deployedContract.function('getsharedRecords');
  }

  Future<List> getSharedRecordsFromBlockchain(String address) async {
    final _address = EthereumAddress.fromHex(address);

    final data = await web3client.call(
        contract: _deployedContract,
        function: getsharedRecords,
        params: [_address]);

    return data;
  }

  Future<List> getPatientRecordsFromBlockchain(
      String authid, String documentid) async {
    final data = await web3client.call(
        contract: _deployedContract,
        function: getPatientsRecords,
        params: [authid, documentid]);

    return data;
  }

  Future<void> addPatientFromBlockchain(String authid) async {
    await web3client.sendTransaction(
        chainId: 11155111,
        _cred,
        Transaction.callContract(
            contract: _deployedContract,
            function: addPatient,
            parameters: [authid]));
  }

  Future<void> addRecordFromBlockchain(String authid, String documentid) async {
    await web3client.sendTransaction(
        chainId: 11155111,
        _cred,
        Transaction.callContract(
            contract: _deployedContract,
            function: addRecord,
            parameters: [authid, documentid]));
  }

  Future<void> deleteRecordFromBlockchain(
      String authid, String documentid, List<String> address) async {
    final ethAddress = address.map((e) => EthereumAddress.fromHex(e)).toList();

    await web3client.sendTransaction(
        chainId: 11155111,
        _cred,
        Transaction.callContract(
            contract: _deployedContract,
            function: deleteRecord,
            parameters: [authid, documentid, ethAddress]));
  }

  Future<void> grantAccessFromBlockchain(
      String authid, String documentid, String address) async {
    final ethAddress = EthereumAddress.fromHex(address);

    await web3client.sendTransaction(
        chainId: 11155111,
        _cred,
        Transaction.callContract(
            contract: _deployedContract,
            function: grantAccess,
            parameters: [authid, documentid, ethAddress]));
  }

  Future<void> revokeAccessFromBlockchain(
      String authid, String documentid, String address) async {
    final ethAddress = EthereumAddress.fromHex(address);

    await web3client.sendTransaction(
        chainId: 11155111,
        _cred,
        Transaction.callContract(
            contract: _deployedContract,
            function: revokeAccess,
            parameters: [authid, documentid, ethAddress]));
  }
}
