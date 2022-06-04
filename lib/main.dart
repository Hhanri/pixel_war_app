import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/helpers/constants.dart';
import 'package:pixel_war_app/helpers/supabase_keys.dart';

void main() async {
  await initializeSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return BlocProvider<ServicesBloc>(
      create: (context) => ServicesBloc()..add(AppInitializeEvent()),
      child: MaterialApp(
        title: AppStringConstants.appTitle,
        theme: AppThemeConstants.theme,
        themeMode: ThemeMode.dark,
        onGenerateRoute: appRouter.onGenerate,
        initialRoute: "/",
      ),
    );
  }
}

