import 'package:flutter/material.dart';
import 'package:pixel_war_app/helpers/constants.dart';

class NoStateErrorScreen extends StatelessWidget {
  const NoStateErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(ErrorConstants.unknownError),
    );
  }
}
