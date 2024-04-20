// To parse this JSON data, do
//
//     final presignModel = presignModelFromMap(jsonString);

import 'dart:convert';

PresignModel presignModelFromMap(String str) =>
    PresignModel.fromMap(json.decode(str));

String presignModelToMap(PresignModel data) => json.encode(data.toMap());

class PresignModel {
  int? expiration;
  String? method;
  SignedHeader? signedHeader;
  String? url;

  PresignModel({
    this.expiration,
    this.method,
    this.signedHeader,
    this.url,
  });

  factory PresignModel.fromMap(Map<String, dynamic> json) => PresignModel(
        expiration: json["expiration"],
        method: json["method"],
        signedHeader: json["signedHeader"] == null
            ? null
            : SignedHeader.fromMap(json["signedHeader"]),
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "expiration": expiration,
        "method": method,
        "signedHeader": signedHeader?.toMap(),
        "url": url,
      };
}

class SignedHeader {
  List<String>? host;

  SignedHeader({
    this.host,
  });

  factory SignedHeader.fromMap(Map<String, dynamic> json) => SignedHeader(
        host: json["Host"] == null
            ? []
            : List<String>.from(json["Host"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "Host": host == null ? [] : List<dynamic>.from(host!.map((x) => x)),
      };
}
