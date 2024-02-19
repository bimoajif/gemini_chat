part of 'gemini_bloc.dart';

@immutable
abstract class GeminiState {}

final class GeminiInitial extends GeminiState {}

final class GeminiLoading extends GeminiState {}

final class GeminiSuccess extends GeminiState {}

final class GeminiError extends GeminiState {}
