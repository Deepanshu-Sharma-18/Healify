import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class LoginController extends GetxController {
  RxString _accountNo = "".obs;
  RxString _balance = "".obs;

  RxBool filledProfileDetails = false.obs;

  String get accountNo => _accountNo.value;
  String get balance => _accountNo.value;

  W3MService? w3mService;

  var chainId = "11155111";
  var contractAddress = "0x94791C982a6d132D5E547a563aE038243C2e6A9F";

  final sepoliaChain = W3MChainInfo(
    chainName: 'Sepolia',
    chainId: "11155111",
    namespace: 'eip155:11155111',
    tokenName: 'ETH',
    rpcUrl: 'https://rpc.sepolia.org/',
    blockExplorer: W3MBlockExplorer(
        name: 'Sepolia Explorer', url: 'https://sepolia.etherscan.io/'),
  );

  Future<void> initialize() async {
    W3MChainPresets.chains.putIfAbsent(chainId, () => sepoliaChain);
    w3mService = W3MService(
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
    await w3mService!.init();
  }

  void updateAccountNo(String accountNo) {
    _accountNo.value = accountNo;
    update();
  }

  void updateBalance(String balance) {
    _balance.value = balance;
    update();
  }
}
