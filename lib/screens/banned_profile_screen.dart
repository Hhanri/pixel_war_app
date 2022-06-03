import 'package:flutter/material.dart';
import 'package:pixel_war_app/helpers/constants.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/message_text_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';

class BannedProfileScreen extends StatelessWidget {
  const BannedProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const MessageTextWidget(text: ErrorConstants.bannedProfileError),
        const SpacerWidget(),
        ButtonWidget(
          parameters: GoBackButtonParameters(
            context: context
          ),
        )
      ],
    );
  }
}
