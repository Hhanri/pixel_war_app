import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/screens/banned_profile_screen.dart';
import 'package:pixel_war_app/screens/loading_screen.dart';
import 'package:pixel_war_app/screens/no_internet_screen.dart';
import 'package:pixel_war_app/screens/no_profile_screen.dart';
import 'package:pixel_war_app/screens/postgrest_error_screen.dart';
import 'package:pixel_war_app/widgets/pixel_grid_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is NoInternetState) {
            return const NoInternetScreen();
          }
          if (state is SignedInState) {
            return PixelGridWidget(parentContext: context);
          }
          if (state is SignedOutState) {
            AppRouter.navigateTo(context: context, route: AppRouter.signInRoute);
          }
          if (state is BannedProfileState) {
            return const BannedProfileScreen();
          }
          if (state is NoProfileState) {
            return const NoProfileScreen();
          }
          if (state is PostgrestErrorState) {
            return PostgrestErrorScreen(error: state.error);
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}