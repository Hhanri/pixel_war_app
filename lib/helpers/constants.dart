import 'package:flutter/material.dart';

class AppStringConstants {
  //app properties
  static const String appTitle = "Pixel War";

  //app titles
  static const String signInTitle = "Sign In";
  static const String signUpTitle = "Sign Up";

  //app texts
  static const String noAccountYetText = "No Account yet ?";
  static const String alreadyHaveAnAccountText = "Already have an account ?";
  static const String noInternet = "No Internet";
}

class TextFormFieldConstants {
  static const String emailLabel = "eMail";
  static const String emailHint = "example@example.com";
  static const String passwordLabel = "Password";
  static const String passwordHint = "your password";
  static const String passwordConfirmationLabel = "Password Confirmation";
  static const String passwordConfirmationHint = "same password";
  static const String usernameLabel = "Username";
  static const String usernameHint = "My Super Unique Username";
}

class ErrorConstants {
  static const String invalidEmailError = "Invalid email";
  static const String passwordLengthError = "Password's length needs to be at least 6";
  static const String passwordsNotMatchingError = "Passwords Not Matching";
}

class AppThemeConstants {
  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark
  );
}