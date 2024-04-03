import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  FocusNode focusNode = FocusNode();

  TextEditingController controller = TextEditingController();

  Widget btnChild = Text('continue →', style: GoogleFonts.spaceGrotesk());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.center,
        children: [buildBackground(context), buildInputKey, buildVersion],
      ),
    );
  }

  Widget buildBackground(context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDFEFE), Color(0xFFF2F6F5)],
          ),
        ),
      );

  Widget get buildVersion => const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't worry your API key is your little secret.",
            style: TextStyle(fontSize: 12, color: CupertinoColors.inactiveGray),
          ),
          SizedBox(
            height: kBottomNavigationBarHeight,
          )
        ],
      );

  Widget get buildInputKey => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.info_circle_fill,
              color: CupertinoColors.darkBackgroundGray,
            ),
          ),
          const Text('Enter your API key to continue:'),
          buildTextField,
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 50,
            child: CupertinoButton(
              color: const Color(0xFFFF6B57),
              borderRadius: BorderRadius.circular(100),
              padding: EdgeInsets.zero,
              disabledColor: CupertinoColors.inactiveGray,
              // onPressed: null,
              onPressed: () async {
                setState(() {
                  // btnChild = SvgPicture.asset(
                  //   'images/bg_asset_star.svg',
                  //   width: 28,
                  // ).animate(onPlay: (controller) {
                  //   controller.repeat();
                  // }).rotate(
                  //   duration: const Duration(milliseconds: 1000),
                  //   delay: const Duration(milliseconds: 200),
                  //   curve: Curves.easeInOut,
                  // );
                  btnChild = CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  );
                });
                await Future.delayed(Duration(seconds: 5));
                setState(() {
                  btnChild =
                      Text('continue →', style: GoogleFonts.spaceGrotesk());
                });
              },
              child: btnChild,
              // child: CircularProgressIndicator.adaptive(
              //   backgroundColor: Colors.white,
              // ),
            ),
          )
        ],
      );

  Widget get buildTextField => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                onChanged: (val) {
                  if (val != "") {
                    //   setState(() {
                    //     buttonColor = const Color(0xFF6CD86B);
                    //     showSendButton = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     buttonColor = Colors.grey;
                    //     showSendButton = false;
                    //   });
                  }
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                expands: false,
                clearButtonMode: OverlayVisibilityMode.editing,
                textAlign: TextAlign.center,
                maxLines: 2,
                minLines: 1,
                // placeholder: "enter here...",
                placeholderStyle: GoogleFonts.spaceMono(
                  fontSize: 12,
                  color: const Color(0xFF62666A),
                  letterSpacing: 1.0,
                ),
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  color: const Color(0xFF62666A),
                  letterSpacing: 1.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7FAF9),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color(0xFF62666A)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color(0xFF62666A)
                          .withOpacity(focusNode.hasFocus ? 0.5 : 1),
                      spreadRadius: 0,
                      blurRadius: focusNode.hasFocus ? 5 : 0,
                      offset: Offset(
                        0,
                        focusNode.hasFocus ? 3 : 0,
                      ), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
