import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:healify/env/env.dart';
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
            "Symptoms": record.symptoms.toString() ?? "",
            "Diagnosis": record.diagnosis.toString() ?? "",
            "Treatment": record.treatment.toString() ?? "",
          },
      ]
    };

    // print(prompt);
    print(Env.GptKey);

    gemini
        .text(
            "Analyze the following  in symptoms diagnosis and treatment and return any prevention and prediction of future diseases in simple structure not json but the input will be in JSON and only give response in text points \n $prompt")
        .then((value) => {_answer.value = value!.output.toString()})
        .catchError((e) => print(e));
  }
}
