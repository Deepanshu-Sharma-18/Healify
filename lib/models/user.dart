// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  Data? data;

  UserModel({
    this.data,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class Data {
  String? id;
  String? name;
  String? username;
  String? height;
  String? weight;
  String? age;
  String? bloodgroup;
  String? gender;
  String? address;
  String? image;
  String? authId;
  List<Record>? records;

  Data({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.image,
    this.authId,
    this.records,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        bloodgroup: json["bloodgroup"],
        gender: json["gender"],
        address: json["address"],
        image: json["image"],
        authId: json["authId"],
        records: json["records"] == null
            ? []
            : List<Record>.from(json["records"]!.map((x) => Record.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "height": height,
        "weight": weight,
        "age": age,
        "bloodgroup": bloodgroup,
        "gender": gender,
        "address": address,
        "image": image,
        "authId": authId,
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toMap())),
      };
}

class Record {
  String? id;
  String? title;
  String? date;
  List<dynamic>? symptoms;
  List<String>? diagnosis;
  List<String>? treatment;
  List<String>? reports;
  String? userId;

  Record({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.reports,
    this.userId,
  });

  factory Record.fromMap(Map<String, dynamic> json) => Record(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        symptoms: json["symptoms"] == null
            ? []
            : List<dynamic>.from(json["symptoms"]!.map((x) => x)),
        diagnosis: json["diagnosis"] == null
            ? []
            : List<String>.from(json["diagnosis"]!.map((x) => x)),
        treatment: json["treatment"] == null
            ? []
            : List<String>.from(json["treatment"]!.map((x) => x)),
        reports: json["reports"] == null
            ? []
            : List<String>.from(json["reports"]!.map((x) => x)),
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "date": date,
        "symptoms":
            symptoms == null ? [] : List<dynamic>.from(symptoms!.map((x) => x)),
        "diagnosis": diagnosis == null
            ? []
            : List<dynamic>.from(diagnosis!.map((x) => x)),
        "treatment": treatment == null
            ? []
            : List<dynamic>.from(treatment!.map((x) => x)),
        "reports":
            reports == null ? [] : List<dynamic>.from(reports!.map((x) => x)),
        "userId": userId,
      };
}
