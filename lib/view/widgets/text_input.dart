import 'package:flutter/material.dart';
import 'package:vibezplay/constants.dart';

class TextInput extends StatelessWidget {
  final TextEditingController myController;
  final IconData myIcon;
  final String mylableText;
  final bool obsercureTxtValue;
  final TextInputType keyboardType;
  final String? Function(String?)? validate;

  const TextInput({
    Key? key,
    required this.myController,
    required this.myIcon,
    required this.mylableText,
    this.validate,
    this.obsercureTxtValue = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      validator: validate,
      obscureText: obsercureTxtValue,
      keyboardType: keyboardType,
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
