import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/const/route_const.dart';
import 'package:study_buddy/screens/auth/login.dart';

import 'widgets/email_textfield.dart';
import 'widgets/password_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailErrorText;

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!isEmailValid(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.length < 10) {
      return 'Must be more or equal to 10 character';
    }
  }

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, successScreenRoute);
    }
  }

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
                  errorTextValidator: _validateEmail,
                  errorText: _emailErrorText,
                ),
                const SizedBox(
                  height: 22.81,
                ),
                const Text("Password"),
                const SizedBox(
                  height: 5.81,
                ),
                PasswordTextfield(
                  text: "Enter your password",
                  controller: _passwordController,
                  errorTextValidator: _validatePassword,
                ),
                const SizedBox(
                  height: 22.81,
                ),
                const Text("Confirm Password"),
                const SizedBox(
                  height: 5.81,
                ),
                PasswordTextfield(
                  text: "Confirm your password",
                  controller: _passwordController,
                  errorTextValidator: _validatePassword,
                ),
                const SizedBox(
                  height: 12.81,
                ),
                const SizedBox(
                  height: 12.81,
                ),
                SizedBox(
                  height: 51.26,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2EC4B6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        _submitForm();
                      },
                      child: const Text(
                        "Create account",
                        style: TextStyle(color: Color(0xffffffff)),
                      )),
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
