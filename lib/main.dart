import 'package:flutter/material.dart';
import 'package:pixel_war_app/helpers/supabase_keys.dart';
import 'package:pixel_war_app/screens/home_page.dart';

void main() async {
  await initializeSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

