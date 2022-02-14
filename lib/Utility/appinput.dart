import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Function onChange;
  final InputType type;
  final String errorText;

   const AppInput(
      {Key? key, required this.hintText,
      required this.labelText,
      required this.controller,
      required this.onChange,
      required this.type,
      this.errorText = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: TextField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
              hintText: hintText,
              errorText: errorText),
          autofocus: false,
          controller: controller,
          onChanged: (text) => onChange(text, type),
        ));
  }
}

enum InputType { email, password }
