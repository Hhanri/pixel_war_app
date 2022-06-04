import 'package:flutter/material.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/pixel_grid_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PixelGridWidget(parentContext: context),
        ButtonWidget(parameters: SignOutButtonParameters(context: context))
      ],
    );
  }
}
