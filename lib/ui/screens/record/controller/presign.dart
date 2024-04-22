import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:healify/models/responsepresign.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:healify/utils/constants.dart';

class Presign {
  Future<PresignModel> getUploadPresignedUrl(
      String username, String objectKey) async {
    var data = {
      "username": username,
      "bucketname": bucketName,
      "objectkey": objectKey,
      "content": getContentType(objectKey)
    };

    var jsonString = jsonEncode(data);

    var response = await http.post(
        Uri.parse(ServerUrl + "generateUploadPresignedUrl"),
        body: jsonString);

    if (response.statusCode == 200) {
      var output = presignModelFromMap(response.body);
      return output;
    } else {
      throw Exception("Failed to fetch data : ${response.body}");
    }
  }

  Future<PresignModel> getDownloadPresignedUrl(
      String username, String objectKey) async {
    var data = {
      "username": username,
      "bucketname": bucketName,
      "objectkey": objectKey,
      "content": getContentType(objectKey)
    };

    var jsonString = jsonEncode(data);

    var response = await http.post(
        Uri.parse(ServerUrl + "generateDownloadPresignedUrl"),
        body: jsonString);

    if (response.statusCode == 200) {
      var output = presignModelFromMap(response.body);
      return output;
    } else {
      throw Exception("Failed to fetch data : ${response.body}");
    }
  }

  Future<void> uploadFileToS3(String presignedUrl, File file) async {
    Dio dio = new Dio();
    var len = await file.length();
    var response = await dio.put(presignedUrl,
        data: file.openRead(),
        options: Options(headers: {
          Headers.contentLengthHeader: len,
        } // set content-length
            ));

    if (response.statusCode == 200 || response.statusCode == 204) {
      if (kDebugMode) {
        print('File uploaded successfully!');
      }
    } else {
      if (kDebugMode) {
        print('Error uploading file: ${response.data}');
      }
    }
  }

  String getContentType(String file) {
    final extension = file.split('.').last;
    switch (extension.toLowerCase()) {
      case 'pdf':
        return 'application/pdf';
      case 'jpg':
        return 'image/jpg';
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      // Add more cases for other extensions as needed
      default:
        return 'application/octet-stream';
    }
  }
}
