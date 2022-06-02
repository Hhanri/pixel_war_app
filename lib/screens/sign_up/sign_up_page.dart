import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/screens/no_internet_page.dart';
import 'package:pixel_war_app/screens/sign_up/sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
          return const SignUpFormWidget();
        },
      ),
    );
  }
}
