import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/submit_button_bloc/bloc/click_submit_button_bloc.dart';
import 'bloc/email_textfield_bloc/email_text_field_bloc.dart';
import 'bloc/password_icon/bloc/password_icon_bloc.dart';
import '../../const/route_const.dart';
import 'bloc/password_textfield_bloc/password_field_bloc.dart';
import 'login.dart';

import 'widgets/email_textfield.dart';
import 'widgets/password_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              )),
          Expanded(child: Container())
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText(
                  headerText: "Sign Up",
                ),
                const Text(
                  "Enter your details below & free sign up",
                  style: TextStyle(color: Color(0xff919191), fontSize: 14),
                ),
                const SizedBox(
                  height: 58,
                ),
                const Text(
                  "Your Email",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 5.81,
                ),
                EmailTextfield(
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 22.81,
                ),
                const Text("Password"),
                const SizedBox(
                  height: 5.81,
                ),
                BlocBuilder<PasswordFieldBloc, PasswordFieldBlocState>(
                  builder: (context, fieldState) {
                    bool previousPasswordVal = false;
                    bool previousSignUpVal = false;
                    return BlocBuilder<PasswordIconBloc, PasswordIconBlocState>(
                      builder: (context, iconState) {
                        if (iconState is SignUpPasswordIconClickedState) {
                          previousPasswordVal = iconState.signUpClickedState!;
                        } else if (iconState
                            is ConfirmSignUpPasswordIconClickedState) {
                          previousSignUpVal = iconState.confirmPasswordState!;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PasswordTextfield(
                              text: "Enter your password",
                              controller: _passwordController,
                              value: fieldState is! PasswordFaildMatch
                                  ? fieldState.value
                                  : null,
                              clickedState:
                                  iconState is SignUpPasswordIconClickedState
                                      ? iconState.signUpClickedState
                                      : previousPasswordVal,
                              state: PasswordFieldState.signUp,
                            ),
                            const SizedBox(
                              height: 22.81,
                            ),
                            const Text("Confirm Password"),
                            const SizedBox(
                              height: 5.81,
                            ),
                            PasswordTextfield(
                              key: key,
                              text: "Confirm your password",
                              controller: _confirmPasswordController,
                              value: fieldState is PasswordFaildMatch
                                  ? fieldState.value
                                  : null,
                              clickedState: iconState
                                      is ConfirmSignUpPasswordIconClickedState
                                  ? iconState.confirmPasswordState
                                  : previousSignUpVal,
                              state: PasswordFieldState.signUpConfirm,
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 12.81,
                ),
                const SizedBox(
                  height: 12.81,
                ),
                BlocListener<ClickSubmitButtonBloc, ClickSubmitButtonState>(
                  listener:
                      (BuildContext context, ClickSubmitButtonState state) {
                    bool firstTime = true;
                    if (context.read<ClickSubmitButtonBloc>().state
                            is ClickSubmitSuccess &&
                        context.read<PasswordFieldBloc>().state
                            is! PasswordFieldError &&
                        firstTime &&
                        _formKey.currentState!.validate()) {
                      firstTime = false;
                      Navigator.pushReplacementNamed(
                          context, successScreenRoute);
                    }
                  },
                  child: SizedBox(
                    height: 51.26,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2EC4B6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          context.read<ClickSubmitButtonBloc>().add(ClickSubmit(
                              confirmPassword: _confirmPasswordController.text,
                              password: _passwordController.text,
                              email: _emailController.text));
                          context.read<EmailTextFieldBloc>().add(
                              ValidateEmailEvent(email: _emailController.text));
                          context.read<PasswordFieldBloc>().add(
                              ValidSignUpPasswordEvent(
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text));
                        },
                        child: const Text(
                          "Create account",
                          style: TextStyle(color: Color(0xffffffff)),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                    side: const BorderSide(color: Color(0xff919191)),
                  ),
                  const Flexible(
                      child: Text(
                    "By creating an account you have to agree with our them & condication.",
                    style: TextStyle(color: Color(0xff919191)),
                  ))
                ]),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                color: Color(0xff858597), fontSize: 14)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context
                                    .read<EmailTextFieldBloc>()
                                    .add(ValidateEmailEvent(email: null));
                                context.read<PasswordFieldBloc>().add(
                                    const ValidPasswordEvent(password: null));
                                context.read<ClickLoginSubmitButtonBloc>().add(
                                    const ClickLoginSubmit(
                                        email: null, password: null));
                                context.read<PasswordIconBloc>().add(
                                    const PasswordIconClickedEvent(
                                        loginState: false));
                                Navigator.pushNamed(context, loginScreenRoute);
                              },
                            text: "Log in",
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xff2EC4B6)))
                      ])),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
