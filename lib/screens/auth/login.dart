import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/email_textfield.dart';
import 'widgets/password_textfield.dart';

import '../../const/route_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginEmail = "sudip@gmail.com";
  final loginPasword = "sudip@123456";
  bool incorrectCredential = false;
  String? _emailErrorText;

  String? _validateEmails(String? value) {
    if (value!.isEmpty) {
      return "Enter a email";
    } else if (!isEmailValid(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        loginEmail == _emailController.text &&
        loginPasword == _passwordController.text) {
      Navigator.pushNamed(context, successScreenRoute);
    } else if (_emailController.text.isEmpty &&
            _passwordController.text.isEmpty ||
        !isEmailValid(_emailController.text)) {
      setState(() {
        incorrectCredential = false;
      });
    } else {
      setState(() {
        incorrectCredential = true;
      });
    }
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    void showExitPopup() {
      showDialog<void>(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text('Exit App'),
          content: const Text('Do you want to exit an App?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xff2EC4B6)),
              //return false when click on "NO"

              child: const Text(
                'No',
                style: TextStyle(color: Color(0xffffffff)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xff2EC4B6))),
              ),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              //return true when click on "Yes"
              child: const Text(
                'Yes',
                style: TextStyle(color: Color(0xff2EC4B6)),
              ),
            ),
          ],
        ),
      ); //if showDialouge had returned null, then return false
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                showExitPopup();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              )),
          Expanded(child: Container())
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didpop) {
          if (didpop) return;
          showExitPopup();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(
                    headerText: "Log in",
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
                    errorTextValidator: _validateEmails,
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
                    height: 12.81,
                  ),
                  incorrectCredential
                      ? const Text(
                          "Incorrect credentials, please enter valid username and password",
                          style: TextStyle(color: Colors.red),
                        )
                      : const SizedBox(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff858597),
                        ),
                      )
                    ],
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
                        onPressed: _submitForm,
                        child: const Text(
                          "Log in",
                          style: TextStyle(color: Color(0xffffffff)),
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  color: Color(0xff858597), fontSize: 14)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                    context, signUpScreenRoute),
                              text: "Sign up",
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xff2EC4B6)))
                        ]))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 1,
                        width: 105,
                        color: const Color(0xffB8B8D2),
                      ),
                      const Text(
                        "Or login with",
                        style:
                            TextStyle(color: Color(0xff858597), fontSize: 14),
                      ),
                      Container(
                        height: 1,
                        width: 105,
                        color: const Color(0xffB8B8D2),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 33,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      InkWell(
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/facebook.png",
                            height: 33,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String headerText;
  const HeaderText({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: const TextStyle(
          fontSize: 32, color: Color(0xff1F1F39), fontWeight: FontWeight.bold),
    );
  }
}
