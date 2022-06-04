import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/dialogs/show_error_dialog.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/screens/banned_profile_screen.dart';
import 'package:pixel_war_app/screens/game/game_screen.dart';
import 'package:pixel_war_app/screens/loading/loading_screen.dart';
import 'package:pixel_war_app/screens/no_state_error_screen.dart';
import 'package:pixel_war_app/screens/no_internet_screen.dart';
import 'package:pixel_war_app/screens/no_profile_screen.dart';
import 'package:pixel_war_app/widgets/pixel_grid_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

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
          final errorModel = state.errorModel;
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
            if (state.isBanned) {
              return const BannedProfileScreen();
            }
            if (!state.hasProfile) {
              return const NoProfileScreen();
            }
            print("in game state");
            return const GameScreen();
          }
          if (state is SignedOutState) {
            print("signing out");
            AppRouter.navigateTo(context: context, route: AppRouter.signInRoute);
          }
          print("no state");
          return const NoStateErrorScreen();
        },
      ),
    );
  }
}