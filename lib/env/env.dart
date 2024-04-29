// lib/env/env.dart
import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: "ServerUrl")
  static const String ServerUrl = _Env.ServerUrl;

  @EnviedField(varName: 'Apikey')
  static const String Apikey = _Env.Apikey;

  @EnviedField(varName: 'BucketName')
  static const String BucketName = _Env.BucketName;

  @EnviedField(varName: 'RpcUrl')
  static const String RpcUrl = _Env.RpcUrl;

  @EnviedField(varName: 'SocketUrl')
  static const String SocketUrl = _Env.SocketUrl;

  @EnviedField(varName: 'PrivateKey')
  static const String PrivateKey = _Env.PrivateKey;

  @EnviedField(varName: 'ContractAddress')
  static const String ContractAddress = _Env.ContractAddress;

  @EnviedField(varName: 'GptKey')
  static const String GptKey = _Env.GptKey;
}
