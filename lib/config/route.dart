import 'package:flutter/material.dart';
import '../screens/auth/signup.dart';
import '../screens/auth/success.dart';
import '../screens/auth/login.dart';
import '../screens/welcome/splash_screen/splash_screen.dart';
import '../const/route_const.dart';
import '../screens/slider/slider_screen.dart';

class StudyBuddyRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sliderScreenRoute:
        return _getPageRoute(const SliderScreen());
      case splashScreenRoute:
        return _getPageRoute(const SplashScreen());
      case loginScreenRoute:
        return _getPageRoute(LoginScreen());
      case signUpScreenRoute:
        return _getPageRoute(SignUpScreen());
      case successScreenRoute:
        return _getPageRoute(const SuccessScreen());
    }
    return null;
  }

  static PageRoute _getPageRoute(Widget viewToShow) {
    return MaterialPageRoute(builder: (_) => viewToShow);
  }
}
