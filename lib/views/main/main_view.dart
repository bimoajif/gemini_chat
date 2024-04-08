import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gemini_chat/services/service.dart';

import '../../app/app.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFFDFEFE),
      navigationBar: CupertinoNavigationBar(
        leading: SvgPicture.asset(
          'images/logo_text.svg',
          width: MediaQuery.of(context).size.width / 2.5,
        ),
      ),
      child: buildBody,
    );
  }

  Widget get buildBody => GestureDetector(
        onTap: () {
          print('tapped');
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: Column(
              // alignment: Alignment.bottomCenter,
              children: [Expanded(child: Body()), TextInputField()],
            ),
          ),
        ),
      );
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String resp;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      color: Colors.black12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              color: Color(0xFFFE5104),
              child: const Text('press me'),
              onPressed: () {
                context
                    .read<GeminiBloc>()
                    .add(InitGemini(prompt: "hello how are you"));
              },
            ),
            BlocBuilder<GeminiBloc, GeminiState>(
              builder: (context, state) {
                print(state);
                if (state is GeminiLoading) {
                  print('here');
                  return buildLoading;
                } else if (state is GeminiSuccess) {
                  resp = state.chats.toString();
                  return Text(resp);
                } else {
                  return Text('aaa');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
