import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/screens/banned_profile_screen.dart';
import 'package:pixel_war_app/screens/confirmation_email_screen.dart';
import 'package:pixel_war_app/screens/error_screen.dart';
import 'package:pixel_war_app/screens/loading_screen.dart';
import 'package:pixel_war_app/screens/no_internet_screen.dart';
import 'package:pixel_war_app/screens/sign_in/sign_in_screen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is NoInternetState) {
            return const NoInternetScreen();
          }
          if (state is SignedInState) {
            AppRouter.navigateTo(context: context, route: AppRouter.gameRoute);
          }
          if (state is SignedOutState) {
            return const SignInScreen();
          }
          if (state is BannedProfileState) {
            return const BannedProfileScreen();
          }
          if (state is ErrorState) {
            return ErrorScreen(error: state.error);
          }
          if (state is ConfirmEmailState) {
            return ConfirmationEmailScreen(email: state.email, password: state.password,);
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
