import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/password_textfield_bloc/bloc/password_field_bloc.dart';

class PasswordTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const PasswordTextfield(
      {super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordFieldBloc, PasswordFieldBlocState>(
      builder: (context, stateField) {
        return BlocBuilder<PasswordIconBloc, PasswordIconBlocState>(
          builder: (context, stateIcon) {
            return TextFormField(
              key: key,
              controller: controller,
              obscureText: false,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () => context.read<PasswordIconBloc>().add(
                        PasswordIconClickedEvent(
                            state: !stateIcon.clickedState!)),
                    child: Icon(
                      stateIcon.clickedState!
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff1F1F39),
                    )),
                hintText: text,
                errorText: stateField.value,
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
          },
        );
      },
    );
  }
}
