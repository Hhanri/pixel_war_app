import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      obscureText: parameters.obscureText,
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
      inputFormatters: parameters.inputFormatters,
    );
  }
}

class TextFormFieldParameters {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?) validator;
  final bool obscureText;
  List<TextInputFormatter>? inputFormatters;
  TextFormFieldParameters({
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator,
    required this.obscureText,
    this.inputFormatters
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
    controller: controller,
    inputFormatters: [
      FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
      FilteringTextInputFormatter.singleLineFormatter
    ]
  );
}

class PasswordParameters extends TextFormFieldParameters {
  PasswordParameters({
    required TextEditingController controller,
  }) : super(
    label: "Password",
    hint: "your password",
    obscureText: true,
    validator: (value) {
      if (value!.length < 6) {
        return "Password's length needs to be at least 6";
      }
      return null;
    },
    controller: controller,
    inputFormatters: [
      FilteringTextInputFormatter.singleLineFormatter
    ]
  );
}

class PasswordConfirmationParameters extends TextFormFieldParameters {
  PasswordConfirmationParameters({
    required TextEditingController controller1,
    required TextEditingController controller2,
  }) : super(
      label: "Password Confirmation",
      hint: "same password",
      obscureText: true,
      validator: (value) {
        if (value!.length < 6) {
          return "Password's length needs to be at least 6";
        } else if (controller1.text != controller2.text){
          return "passwords not matching";
        }
        return null;
      },
      controller: controller1,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter
      ]
  );
}