import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:meta/meta.dart';

part 'gemini_event.dart';
part 'gemini_state.dart';

class GeminiBloc extends Bloc<GeminiEvent, GeminiState> {
  GeminiBloc() : super(GeminiInitial()) {
    on<AskGemini>(_ask);
  }

  late String apiKey;

  Future<String?> _ask(event, emit) async {
    emit(GeminiLoading());
    const apiKey = '';
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }

    final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(maxOutputTokens: 100));

    final prompt = event.prompt;
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
  }
}
