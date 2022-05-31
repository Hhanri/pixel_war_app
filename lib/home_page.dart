import 'package:flutter/material.dart';
import 'package:pixel_war_app/pixel_grid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: PixelGridWidget()),
    );
  }
}