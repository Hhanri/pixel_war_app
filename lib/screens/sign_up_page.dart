import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/text_form_field_widget.dart';
import 'package:pixel_war_app/helpers/extensions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmationController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SpacerWidget(),
          TextFormFieldWidget(
            controller: emailController,
            label: "eMail",
            hint: "example@example.com",
            validator: (value) {
              if (!value.isEmail()) {
                return "Invalid email";
              }
              return null;
            },
          ),
          TextFormFieldWidget(
            controller: passwordController,
            label: "Password",
            hint: "your password",
            validator: (value) {
              return null;
            },
          ),
          TextFormFieldWidget(
            controller: passwordConfirmationController,
            label: "Password Confirmation",
            hint: "type in the same password",
            validator: (value) {
              if (passwordController.text != value) {
                return "password not matching";
              }
              return null;
            },
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
