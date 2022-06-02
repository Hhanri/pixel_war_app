import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/bloc/services_bloc.dart';
import 'package:pixel_war_app/screens/sign_up_page.dart';
import 'package:pixel_war_app/widgets/button_widget.dart';
import 'package:pixel_war_app/widgets/logo_widget.dart';
import 'package:pixel_war_app/widgets/spacer_widget.dart';
import 'package:pixel_war_app/widgets/text_form_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
              ButtonWidget(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<ServicesBloc>(context).add(SignInEvent(email: emailController.text, password: passwordController.text));
                  }
                },
                text: 'Sign In'
              ),
              const SpacerWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("No account ?"),
                  TextButton(
                    onPressed: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("Sign Up")
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}