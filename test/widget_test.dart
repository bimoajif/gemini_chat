// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:gemini_chat/main.dart';

void main() {
  test('generative AI', () {
    generativeAi();
  });
}

Future<void> generativeAi() async {
  // Access your API key as an environment variable (see "Set up your API key" above)
  // final apiKey = Platform.environment['API_KEY'];
  const apiKey = '';
  if (apiKey == null) {
    print('No \$API_KEY environment variable');
    exit(1);
  }
  // For text-only input, use the gemini-pro model
  final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 100));
  // Initialize the chat
  final chat = model.startChat(history: [
    Content.text('Hello, I have 2 dogs in my house.'),
    Content.model([TextPart('Great to meet you. What would you like to know?')])
  ]);
  var content = Content.text('How many paws are in my house?');
  var response = await chat.sendMessage(content);
  print(response.text);
}
