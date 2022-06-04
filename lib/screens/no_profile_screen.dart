import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';
import 'package:pixel_war_app/widgets/text_form_field_widget.dart';

class NoProfileScreen extends HookWidget {
  const NoProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController usernameController = useTextEditingController();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormFieldWidget(
            parameters: UsernameParameters(controller: usernameController)
          ),
          const SpacerWidget(),
          ButtonWidget(
            parameters: CreateProfileButtonParameters(
              context: context,
              formKey: formKey,
              usernameController: usernameController
            )
          )
        ],
      ),
    );
  }
}
