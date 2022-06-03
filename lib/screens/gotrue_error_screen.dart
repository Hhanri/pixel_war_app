import 'package:flutter/material.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/message_text_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoTrueErrorScreen extends StatelessWidget {
  final GotrueError error;
  const GoTrueErrorScreen({
    Key? key,
    required this.error
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (error.statusCode != null)
          MessageTextWidget(text: error.statusCode!),
        MessageTextWidget(text: error.message),
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
