import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiRepository {
  final String apiKey;
  late GenerativeModel model;

  GeminiRepository({this.apiKey = ''});

  Future<ChatSession> initial({required String prompt}) async {
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }

    model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(maxOutputTokens: 100));

    await ask(prompt: prompt).then((value) {});

    final chat = model.startChat(history: [
      Content.text('Hello, I my name is bimo.'),
      Content.model(
          [TextPart('Great to meet you. What would you like to know?')])
    ]);

    return chat;
  }

  Future<String?> ask({required String prompt}) async {
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    return response.text;
  }
}
