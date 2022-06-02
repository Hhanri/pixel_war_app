import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/screens/confirmation_email_screen.dart';
import 'package:pixel_war_app/screens/error_screen.dart';
import 'package:pixel_war_app/screens/loading_screen.dart';
import 'package:pixel_war_app/screens/no_internet_screen.dart';
import 'package:pixel_war_app/screens/sign_up/sign_up_screen.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is NoInternetState) {
            return const NoInternetScreen();
          }
          if (state is SignedInState) {
            Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.gameRoute, (route) => false);
          }
          if (state is SignedOutState) {
            return const SignUpScreen();
          }
          if (state is ErrorState) {
            return ErrorScreen(error: state.error);
          }
          if (state is ConfirmEmailState) {
            return ConfirmationEmailScreen(email: state.email, password: state.password);
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
