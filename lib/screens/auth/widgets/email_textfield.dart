import 'package:flutter/material.dart';

class EmailTextfield extends StatelessWidget {
  final FormFieldValidator<String>? errorTextValidator;
  final String? errorText;
  final TextEditingController controller;
  const EmailTextfield(
      {super.key,
      required this.errorText,
      required this.errorTextValidator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      validator: errorTextValidator,
      decoration: InputDecoration(
        hintText: "Enter your email ",
        errorText: errorText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2EC4B6)),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffB8B8D2)),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffB8B8D2)),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffB8B8D2)),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
