import 'package:flutter/material.dart';

class PasswordTextfield extends StatelessWidget {
  final String text;
  const PasswordTextfield({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      ),
    );
  }
}
