// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gemini_chat/services/service.dart';

void main() {
  BlocProvider<GeminiBloc>(
    create: (context) => GeminiBloc(),
  );

  test('generative AI', () {
    BlocListener<GeminiBloc, GeminiState>(
      listener: (context, state) {
        GeminiBloc().add(InitGemini(prompt: 'hello how are you'));
        if (state is GeminiSuccess) {
          print(state.chats);
        } else {
          print('loading...');
        }
      },
    );
  });
}
