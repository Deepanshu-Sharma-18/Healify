import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:healify/models/record.dart';
import 'package:healify/models/user.dart';

class GptController {
  Rx<String> _answer = "".obs;

  String get answer => _answer.value;

  Future<void> getResults(List<Record>? records) async {
    final gemini = Gemini.instance;

    var prompt = {
      "Records": [
        for (var record in records ?? [])
          {
            "Symptoms": record.symptoms ?? "",
            "Diagnosis": record.diagnosis ?? "",
            "Treatment": record.treatment ?? "",
          },
      ]
    };

    print(prompt);

    gemini
        .text(
            "Analyze the following  in symptoms diagnosis and treatment and return any prevention and prediction of future diseases in simple structure not json. \n $prompt")
        .then((value) => {_answer.value = value!.output.toString()})
        .catchError((e) => print(e));
  }
}
