import 'package:flutter/material.dart';
import 'package:pixel_war_app/helpers/app_router.dart';
import 'package:pixel_war_app/helpers/constants.dart';
import 'package:pixel_war_app/widgets/additional_link_widget.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/logo_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';
import 'package:pixel_war_app/widgets/text_form_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: SingleChildScrollView(
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
                parameters: SignUpButtonParameters(
                  context: context,
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController
                ),
              ),
              AdditionalLinkWidget(
                text: AppStringConstants.alreadyHaveAnAccountText,
                linkText: AppStringConstants.signInTitle,
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
