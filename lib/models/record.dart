// To parse this JSON data, do
//
//     final recordModel = recordModelFromMap(jsonString);

import 'dart:convert';

import 'package:healify/models/user.dart';

RecordModel recordModelFromMap(String str) =>
    RecordModel.fromMap(json.decode(str));

String recordModelToMap(RecordModel data) => json.encode(data.toMap());

class RecordModel {
  Data? data;

  RecordModel({
    this.data,
  });

  factory RecordModel.fromMap(Map<String, dynamic> json) => RecordModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class Data {
  String? id;
  String? title;
  String? date;
  List<dynamic>? symptoms;
  List<String>? diagnosis;
  List<String>? treatment;
  List<Report>? reports;
  String? userId;

  Data({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.reports,
    this.userId,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
            : List<Report>.from(json["reports"]!.map((x) => Report.fromMap(x))),
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
