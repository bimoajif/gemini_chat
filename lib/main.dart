import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'services/service.dart';
import 'views/views.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeminiBloc>(
      create: (_) => GeminiBloc(),
      child: const App(),
    );
    // return MultiBlocProvider(
    //   providers: providers,
    //   child: const App(),
    // );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      // home: SplashView(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialWithModalsPageRoute(
                builder: (_) => const SplashView(), settings: settings);
          default:
            return MaterialWithModalsPageRoute(
                builder: (_) => const SplashView(), settings: settings);
        }
      },
    );
  }
}
