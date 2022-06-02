import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/constants.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/message_text_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';

class ConfirmationEmailScreen extends StatelessWidget {
  final String email;
  final String password;
  const ConfirmationEmailScreen({
    Key? key,
    required this.email,
    required this.password
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const MessageTextWidget(text: AppStringConstants.confirmEmail),
        const SpacerWidget(),
        ButtonWidget(
          onPressed: () {
            BlocProvider.of<ServicesBloc>(context).add(SignUpEvent(email: email, password: password));
          },
          text: AppStringConstants.resendLink
        ),
        const SpacerWidget(),
        ButtonWidget(
          onPressed: () {
            BlocProvider.of<ServicesBloc>(context).add(SignOutEvent());
          },
          text: AppStringConstants.goBackTitle
        ),
      ],
    );
  }
}
