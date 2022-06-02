import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
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
      create: (context) => ServicesBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark
        ),
        themeMode: ThemeMode.dark,
        onGenerateRoute: appRouter.onGenerate,
        initialRoute: AppRouter.signInRoute,
      ),
    );
  }
}

