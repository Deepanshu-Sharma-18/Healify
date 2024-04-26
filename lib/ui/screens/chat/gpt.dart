import 'package:dart_openai/dart_openai.dart';
import 'package:healify/env/env.dart';
import 'package:http/http.dart' as http;

class GptController {
  Future<void> getResults(dynamic data) async {
    OpenAI.apiKey = Env.apikey;
    final completion = await OpenAI.instance.completion.create(
      model: "gpt-3.5-turbo",
      prompt: "Dart is",
    );

    print(completion.choices[0].text);
  }
}
