import 'package:flutter/material.dart';
import 'package:study_buddy/screens/search/search_study_material.dart';
import '../screens/study_plans/add_study_plan.dart';

import '../const/route_const.dart';
import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/auth/success.dart';
import '../screens/bottom_navigation/bottom_navigation.dart';
import '../screens/slider/slider_screen.dart';
import '../screens/welcome/splash_screen/splash_screen.dart';

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
      case bottomNavigationScreenRoute:
        return _getPageRoute(const CustomBottomNavigation());
      case addStudyPlansRoute:
        return _getPageRoute(const AddStudyPlans());
      case searchStudyMaterial:
        return _getPageRoute(const SearchStudyMaterial());
    }
    return null;
  }

  static PageRoute _getPageRoute(Widget viewToShow) {
    return MaterialPageRoute(builder: (_) => viewToShow);
  }
}
