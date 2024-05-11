import 'package:flutter/material.dart';

class PasswordTextfield extends StatelessWidget {
  final FormFieldValidator<String>? errorTextValidator;

  final TextEditingController controller;
  final String text;
  const PasswordTextfield(
      {super.key,
      required this.text,
      this.errorTextValidator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: errorTextValidator,
      obscureText: true,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          false ? Icons.visibility : Icons.visibility_off,
          color: Color(0xff1F1F39),
        ),
        hintText: text,
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
