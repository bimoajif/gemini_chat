import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  gemini();
}

Future<void> gemini() async {
  // Access your API key as an environment variable (see "Set up your API key" above)
  // final apiKey = Platform.environment['API_KEY'];
  const apiKey = '';
  if (apiKey == null) {
    stderr.writeln(r'No $GOOGLE_API_KEY environment variable');
    exit(1);
  }
  final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 100));

  // init chat
  final chat = model.startChat(history: [
    Content.text('Hello, I my name is bimo.'),
    Content.model([TextPart('Great to meet you. What would you like to know?')])
  ]);

  var message = 'How many paws are in my house?';
  print('Message: $message');
  var content = Content.text(message);
  var CountTokensResponse(:totalTokens) =
      await model.countTokens([...chat.history, content]);
  print('Token count: $totalTokens');
  var response = await chat.sendMessage(content);
  print('Response: ${response.text}');

  content = Content.text('How many noses (including mine)?');
  CountTokensResponse(:totalTokens) =
      await model.countTokens([...chat.history, content]);
  print('Token count: $totalTokens');
  response = await chat.sendMessage(content);
  print('Response: ${response.text}');

  print('Chat history:');
  for (final content in chat.history) {
    print('${content.role}:');
    for (final part in content.parts) {
      switch (part) {
        case TextPart(:final text):
          print(text);
        case _:
          print('Non text content');
      }
    }
  }
}
