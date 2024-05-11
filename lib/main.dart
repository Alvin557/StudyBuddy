import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/route.dart';
import 'const/route_const.dart';
import 'screens/auth/bloc/email_textfield_bloc/email_text_field_bloc.dart';
import 'screens/auth/bloc/password_textfield_bloc/bloc/password_field_bloc.dart';
import 'screens/auth/bloc/submit_button/bloc/click_submit_button_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<EmailTextFieldBloc>(create: (context) => EmailTextFieldBloc()),
    BlocProvider<PasswordFieldBloc>(create: (context) => PasswordFieldBloc()),
    BlocProvider<PasswordIconBloc>(create: (context) => PasswordIconBloc()),
    BlocProvider<ClickSubmitButtonBloc>(
        create: (context) => ClickSubmitButtonBloc()),
    BlocProvider<ClickLoginSubmitButtonBloc>(
        create: (context) => ClickLoginSubmitButtonBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      child: SafeArea(
        child: MaterialApp(
          initialRoute: splashScreenRoute,
          onGenerateRoute: StudyBuddyRoute.generateRoute,
        ),
      ),
    );
  }
}
