import 'package:flutter/material.dart';
import 'package:vibezplay/constants.dart';

class TextInput extends StatelessWidget {
  final TextEditingController myController;
  final IconData myIcon;
  final String mylableText;
  final bool obsercureTxtValue;

  const TextInput({
    Key? key,
    required this.myController,
    required this.myIcon,
    required this.mylableText,
    this.obsercureTxtValue = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      obscureText: obsercureTxtValue,
      decoration: InputDecoration(
        icon: Icon(myIcon),
        labelText: mylableText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: kBorderColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: kBorderColor,
            )),
      ),
    );
  }
}
