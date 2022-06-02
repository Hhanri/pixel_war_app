import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/text_form_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmationController = TextEditingController();

    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SpacerWidget(),
            TextFormFieldWidget(
              parameters: EmailParameters(
                controller: emailController
              ),
            ),
            TextFormFieldWidget(
              parameters: PasswordParameters(
                controller: passwordController,
                label: "Password",
                hint: "your password"
              ),
            ),
            TextFormFieldWidget(
              parameters: PasswordConfirmationParameters(
                controller1: passwordConfirmationController,
                controller2: passwordController,
                label: "Password Confirmation",
                hint: "same password"
              ),
            ),
            const SpacerWidget(),
            ButtonWidget(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<ServicesBloc>(context).add(SignUpEvent(email: emailController.text, password: passwordController.text));
                }
              },
              text: 'Sign Up'
            )
          ],
        ),
      ),
    );
  }
}

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
