import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/widgets/additional_link_widget.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/logo_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';
import 'package:pixel_war_app/widgets/text_form_field_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmationController = TextEditingController();

    return Form(
      key: formKey,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          reverse: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoWidget(),
              const SpacerWidget(),
              TextFormFieldWidget(
                parameters: EmailParameters(
                  controller: emailController
                ),
              ),
              const SpacerWidget(),
              TextFormFieldWidget(
                parameters: PasswordParameters(
                  controller: passwordController,
                ),
              ),
              const SpacerWidget(),
              TextFormFieldWidget(
                parameters: PasswordConfirmationParameters(
                  controller1: passwordConfirmationController,
                  controller2: passwordController,
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
              ),
              AdditionalLinkWidget(
                text: "Already have an account ?",
                linkText: "Sign In",
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.signInRoute, (route) => false);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
