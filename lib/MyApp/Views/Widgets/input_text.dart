import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final int? textMinLins;
  final int? textMaxline;
  final String hint;
  final double? fontSize;

  final TextEditingController controller;

  const InputText({
    Key? key,
    this.textMinLins = 1,
    this.textMaxline = 1,
    required this.hint,
    this.fontSize = 20,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: fontSize),
      keyboardType: TextInputType.text,
      minLines: textMinLins,
      maxLines: textMaxline,
      decoration: InputDecoration(
          hintText: hint, hintStyle: const TextStyle(fontSize: 25)),
    );
  }
}
