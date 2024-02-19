import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app.dart';
import '../main/main_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute<void>(
            builder: (BuildContext context) => const MainView(),
            fullscreenDialog: true),
      );
    });

    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [buildBackground(context), buildVersion, buildLoading],
      ),
    );
  }

  Widget get buildVersion => const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'AI powered by Google Gemini',
            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
          ),
          Text(
            'v0.0.1-alpha',
            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
          ),
          SizedBox(
            height: kBottomNavigationBarHeight,
          )
        ],
      );

  Widget buildBackground(context) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEDEFE9), Color(0xFF489DC7)],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'images/bg_asset_star.svg',
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/ic_logo.png',
                    width: 50,
                  ),
                  const SizedBox(height: 10),
                  SvgPicture.asset(
                    'images/logo_text.svg',
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          )
              .animate()
              .scale(curve: Curves.easeOut, duration: Durations.extralong4)
              .fade(duration: Durations.extralong4),
        ],
      );
}
