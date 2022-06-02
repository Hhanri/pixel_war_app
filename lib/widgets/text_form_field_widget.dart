import 'package:flutter/material.dart';
import 'package:pixel_war_app/helpers/extensions.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextFormFieldParameters parameters;
  const TextFormFieldWidget({
    Key? key, required this.parameters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: parameters.controller,
      validator: (value) {
        return parameters.validator(value);
      },
      decoration: InputDecoration(
        label: Text(parameters.label),
        hintText: parameters.hint,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}

class TextFormFieldParameters {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?) validator;
  final bool obscureText;

  TextFormFieldParameters({
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator,
    required this.obscureText
  });
}

class EmailParameters extends TextFormFieldParameters {
  EmailParameters({
    required TextEditingController controller
  }) : super(
    label: "eMail",
    hint: "example@example.com",
    obscureText: false,
    validator: (value) {
      if (!value.isEmail()) {
        return "Invalid email";
      }
      return null;
    },
    controller: controller
  );
}

class PasswordParameters extends TextFormFieldParameters {
  PasswordParameters({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) : super(
    label: label,
    hint: hint,
    obscureText: false,
    validator: (value) {
      if (value!.length < 6) {
        return "Password's length needs to be at least 6";
      }
      return null;
    },
    controller: controller
  );
}

class PasswordConfirmationParameters extends TextFormFieldParameters {
  PasswordConfirmationParameters({
    required TextEditingController controller1,
    required TextEditingController controller2,
    required String label,
    required String hint,
  }) : super(
      label: label,
      hint: hint,
      obscureText: false,
      validator: (value) {
        if (value!.length < 6) {
          return "Password's length needs to be at least 6";
        } else if (controller1.text != controller2.text){
          return "passwords not matching";
        }
        return null;
      },
      controller: controller1
  );
}