import 'package:get/get.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class Web3Controller extends GetxController {
  late ContractAbi _abiCode;
  late Credentials _cred;
  late DeployedContract _deployedContract;
  EthPrivateKey? _privateKey;

  late ContractFunction addPatient;
  late ContractFunction addRecord;
  late ContractFunction deleteRecord;
  late ContractFunction getPatientsRecords;
  late ContractFunction grantAccess;
  late ContractFunction revokeAccess;

  late Web3Client web3client;
}
