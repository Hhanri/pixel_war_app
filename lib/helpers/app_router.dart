import 'package:flutter/material.dart';
import 'package:pixel_war_app/screens/game/game_page.dart';
import 'package:pixel_war_app/screens/sign_in/sign_in_page.dart';
import 'package:pixel_war_app/screens/sign_up/sign_up_page.dart';

class AppRouter {
  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case signInRoute : return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUpRoute : return MaterialPageRoute(builder: (_) => const SignUpPage());
      case gameRoute : return MaterialPageRoute(builder: (_) => const GamePage());
      default : return MaterialPageRoute(builder: (_) => const SignInPage());
    }
  }

  static const String signInRoute = "/signIn";
  static const String signUpRoute = "/signUp";
  static const String gameRoute = "/game";

  static void navigateTo({required BuildContext context, required String route}) {
    Future.microtask(() => Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false));

  }
}

