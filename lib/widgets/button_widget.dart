import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/constants.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonWidgetParameters parameters;
  const ButtonWidget({
    Key? key,
    required this.parameters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: parameters.onPressed,
      child: Text(parameters.text)
    );
  }
}

class ButtonWidgetParameters {
  final VoidCallback onPressed;
  final String text;

  ButtonWidgetParameters({
    required this.onPressed,
    required this.text
  });
}

class GoBackButtonParameters extends ButtonWidgetParameters {
  final BuildContext context;
  GoBackButtonParameters({
    required this.context,
  }) : super (
    onPressed: () {
      BlocProvider.of<ServicesBloc>(context).add(SignOutEvent());
    },
    text: AppStringConstants.goBackTitle
  );
}

class SignUpButtonParameters extends ButtonWidgetParameters {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  SignUpButtonParameters({
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.formKey
  }) : super (
    onPressed: () {
      FocusManager.instance.primaryFocus?.unfocus();
      if (formKey.currentState!.validate()) {
        BlocProvider.of<ServicesBloc>(context).add(
          SignUpEvent(
            email: emailController.text,
            password: passwordController.text,
          )
        );
      }
    },
    text: AppStringConstants.signUpTitle
  );
}

class SignInButtonParameters extends ButtonWidgetParameters {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  SignInButtonParameters({
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.formKey
  }) : super (
    onPressed: () {
      FocusManager.instance.primaryFocus?.unfocus();
      if (formKey.currentState!.validate()) {
        BlocProvider.of<ServicesBloc>(context).add(
          SignInEvent(
            email: emailController.text,
            password: passwordController.text
          )
        );
      }
    },
    text: AppStringConstants.signInTitle
  );
}

class ResendLinkButtonParameters extends ButtonWidgetParameters {
  final BuildContext context;
  final String email;
  final String password;
  ResendLinkButtonParameters({
    required this.context,
    required this.email,
    required this.password,
  }) : super (
    onPressed: () {
      BlocProvider.of<ServicesBloc>(context).add(SignUpEvent(email: email, password: password));
    },
    text: AppStringConstants.resendLink
  );
}

class SignOutButtonParameters extends ButtonWidgetParameters {
  final BuildContext context;
  SignOutButtonParameters({
    required this.context,
  }) : super (
    onPressed: () {
      BlocProvider.of<ServicesBloc>(context).add(SignOutEvent());
    },
    text: AppStringConstants.signOutTitle
  );
}