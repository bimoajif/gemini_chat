import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chat/data/data.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:meta/meta.dart';

part 'gemini_event.dart';
part 'gemini_state.dart';

class GeminiBloc extends Bloc<GeminiEvent, GeminiState> {
  GeminiBloc() : super(GeminiInitial()) {
    on<InitGemini>(_init);
    on<AskGemini>(_ask);
  }

  late String apiKey;
  late GenerativeModel model;

  void _init(event, emit) async {
    print(event.prompt);
    emit(GeminiLoading());
    GeminiRepository repo = GeminiRepository(apiKey: "");

    await repo.initial(prompt: event.prompt).then((value) {
      print(value.runtimeType);
      emit(GeminiSuccess(chats: value));
    });
  }

  Future<String?> _ask(event, emit) async {
    emit(GeminiLoading());
  }
}
