import 'dart:convert';
import 'dart:io';
import 'package:healify/models/responsepresign.dart';
import 'package:http/http.dart' as http;
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
    final bytes = await file.readAsBytes();

    final request = http.MultipartRequest('PUT', Uri.parse(presignedUrl));
    request.fields['Content-Type'] = getContentType(file.path.toString());

    final multipartFile = http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: file.path.split("/").last.toString(),
    );
    request.files.add(multipartFile);

    final response = await request.send();
    // final responseStream = await response.stream.toBytes();

    if (response.statusCode == 200) {
      print('File uploaded successfully!');
    } else {
      print('Error uploading file: ${response.reasonPhrase}');
      // print(
      //     'Response body: ${String.fromCharCodes(responseStream)}'); // For debugging
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
