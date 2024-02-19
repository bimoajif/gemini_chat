import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              children: [
                Expanded(
                    child: Placeholder(
                  color: Colors.black12,
                )),
                TextInputField()
              ],
            ),
          ),
        ),
      );
}
