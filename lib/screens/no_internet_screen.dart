import 'package:flutter/widgets.dart';
import 'package:pixel_war_app/helpers/constants.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStringConstants.noInternet),
    );
  }
}
