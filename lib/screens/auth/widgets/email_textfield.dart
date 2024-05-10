import 'package:flutter/material.dart';

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter your email ",
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
