part of 'gemini_bloc.dart';

@immutable
abstract class GeminiEvent {}

final class AskGemini extends GeminiEvent {
  final String prompt;

  AskGemini({required this.prompt});
}

final class GeminiResponse extends GeminiEvent {
  final List<String> responses;

  GeminiResponse({required this.responses});
}
