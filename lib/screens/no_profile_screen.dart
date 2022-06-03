import 'package:flutter/material.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';
import 'package:pixel_war_app/widgets/text_form_field_widget.dart';

class NoProfileScreen extends StatefulWidget {
  const NoProfileScreen({Key? key}) : super(key: key);

  @override
  State<NoProfileScreen> createState() => _NoProfileScreenState();
}

class _NoProfileScreenState extends State<NoProfileScreen> {

  late GlobalKey<FormState> formKey;
  late TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
