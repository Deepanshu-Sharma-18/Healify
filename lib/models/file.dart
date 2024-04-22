// To parse this JSON data, do
//
//     final fileModel = fileModelFromMap(jsonString);

import 'dart:convert';

FileModel fileModelFromMap(String str) => FileModel.fromMap(json.decode(str));

String fileModelToMap(FileModel data) => json.encode(data.toMap());

class FileModel {
  String? id;
  String? bucketName;
  String? objectKey;
  String? content;
  String? username;
  String? recordId;

  FileModel({
    this.id,
    this.bucketName,
    this.objectKey,
    this.content,
    this.username,
    this.recordId,
  });

  factory FileModel.fromMap(Map<String, dynamic> json) => FileModel(
        id: json["id"],
        bucketName: json["bucketName"],
        objectKey: json["objectKey"],
        content: json["content"],
        username: json["username"],
        recordId: json["recordId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "bucketName": bucketName,
        "objectKey": objectKey,
        "content": content,
        "username": username,
        "recordId": recordId,
      };
}
