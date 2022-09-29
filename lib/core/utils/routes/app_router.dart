import 'package:booking_app/core/bottom_navigation/pages/main_screen.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/features/get_started/pages/get_started_screen.dart';
import 'package:booking_app/features/language/pages/lang_screen.dart';
import 'package:booking_app/features/login/login_screen.dart';
import 'package:booking_app/features/onboarding/pages/onboarding_screen.dart';
import 'package:booking_app/features/profile/pages/profile_details_screen.dart';
import 'package:booking_app/features/register/register_screen.dart';
import 'package:booking_app/features/setting/pages/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static const animationDuration = Duration(milliseconds: 600);

  static PageTransition? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/main':
        return PageTransition(
          child: MainScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );
      case '/lang':
        return PageTransition(
          child: LangScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      case '/getStarted':
        return PageTransition(
          child: GetStartedScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      case '/onboarding':
        return PageTransition(
          child: OnBoardScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      case '/login':
        return PageTransition(
          child: LoginScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      case '/register':
        return PageTransition(
          child: RegisterScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      case '/setting':
        return PageTransition(
          child: SettingScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      case '/profileDetails':
        UserModel obj = settings.arguments as UserModel;
        return PageTransition(
          child: ProfileDetailsScreen(user: obj),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      // case '/SessionsDatesScreen':
      //   bool? isBookingScreen = settings.arguments as bool?;
      //   return PageTransition(
      //     child: SessionsDatesScreen(isBookingScreen: isBookingScreen ?? true),
      //     type: PageTransitionType.rightToLeft,
      //     duration: animationDuration,
      //     settings: settings,
      //   );
      //

      default:
        return null;
    }
  }
}
