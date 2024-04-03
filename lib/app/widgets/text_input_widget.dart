import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({super.key});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  TextEditingController textController = TextEditingController();

  Color buttonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return buildTextField;
  }

  Widget get buildTextField => Padding(
        padding: const EdgeInsets.all(12.0),
        child: CupertinoTextField(
          onChanged: (val) {
            if (val != "") {
              setState(() {
                buttonColor = const Color(0xFF329369);
              });
            } else {
              setState(() {
                buttonColor = Colors.grey;
              });
            }
          },
          onTapOutside: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: textController,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 12.0,
          ),
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: SizedBox(
              height: 32,
              width: 32,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.arrow_up,
                  color: Colors.white,
                  weight: 5,
                ),
              ),
            ),
          ),
          expands: true,
          maxLines: null,
          minLines: null,
          placeholder: "Tulis pesan anda",
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF62666A))),
        ),
      );
}
