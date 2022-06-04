import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/dialogs/show_error_dialog.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/models/error_model.dart';
import 'package:pixel_war_app/screens/loading/loading_screen.dart';
import 'package:pixel_war_app/screens/no_state_error_screen.dart';
import 'package:pixel_war_app/screens/no_internet_screen.dart';
import 'package:pixel_war_app/screens/sign_in/sign_in_screen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ServicesBloc, ServicesState>(
        listener: (context, state) {
          if (state.isLoading) {
            LoadingScreen.instance().show(context: context, text: 'loading...');
          } else {
            LoadingScreen.instance().hide();
          }
          final ErrorModel? errorModel = state.errorModel;
          if (errorModel != null) {
            showErrorModel(
              errorModel: errorModel,
              context: context,
            );
          }
        },
        builder: (context, state) {
          if (state is NoInternetState) {
            return const NoInternetScreen();
          }
          if (state is SignedInState) {
            print("signing in state");
            AppRouter.navigateTo(context: context, route: AppRouter.gameRoute);
          }
          if (state is SignedOutState) {
            print("singed out state");
            return const SignInScreen();
          }
          print("no state");
          return const NoStateErrorScreen();
        },
      ),
    );
  }
}
