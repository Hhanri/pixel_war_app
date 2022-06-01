import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/screens/no_internet_page.dart';
import 'package:pixel_war_app/widgets/pixel_grid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ServicesBloc(
        ),
        child: BlocBuilder<ServicesBloc, ServicesState>(
          builder: (context, state) {
            if (state is NoInternetState) {
              return const NoInternetScreen();
            }
            return PixelGridWidget(parentContext: context);
          },
        ),
      ),
    );
  }
}