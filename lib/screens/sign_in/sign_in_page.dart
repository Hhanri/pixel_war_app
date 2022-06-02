import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/screens/loading_page.dart';
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
          return const LoadingScreen();
        },
      ),
    );
  }
}
