import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_war_app/helpers/constants.dart';
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
      keyboardType: parameters.keyboardType,
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
  List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  TextFormFieldParameters({
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator,
    required this.obscureText,
    required this.inputFormatters,
    required this.keyboardType
  });
}

class EmailParameters extends TextFormFieldParameters {
  EmailParameters({
    required TextEditingController controller
  }) : super(
    label: TextFormFieldConstants.emailLabel,
    hint: TextFormFieldConstants.emailHint,
    obscureText: false,
    validator: (value) {
      if (!value.isEmail()) {
        return ErrorConstants.invalidEmailError;
      }
      return null;
    },
    controller: controller,
    inputFormatters: [
      FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
      FilteringTextInputFormatter.singleLineFormatter
    ],
    keyboardType: TextInputType.emailAddress
  );
}

class PasswordParameters extends TextFormFieldParameters {
  PasswordParameters({
    required TextEditingController controller,
  }) : super(
    label: TextFormFieldConstants.passwordLabel,
    hint: TextFormFieldConstants.passwordHint,
    obscureText: true,
    validator: (value) {
      if (value!.length < 6) {
        return ErrorConstants.passwordLengthError;
      }
      return null;
    },
    controller: controller,
    inputFormatters: [
      FilteringTextInputFormatter.singleLineFormatter
    ],
    keyboardType: TextInputType.visiblePassword
  );
}

class PasswordConfirmationParameters extends TextFormFieldParameters {
  PasswordConfirmationParameters({
    required TextEditingController controller1,
    required TextEditingController controller2,
  }) : super(
      label: TextFormFieldConstants.passwordConfirmationLabel,
      hint: TextFormFieldConstants.passwordConfirmationHint,
      obscureText: true,
      validator: (value) {
        if (value!.length < 6) {
          return ErrorConstants.passwordLengthError;
        } else if (controller1.text != controller2.text){
          return ErrorConstants.passwordsNotMatchingError;
        }
        return null;
      },
      controller: controller1,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter
      ],
    keyboardType: TextInputType.visiblePassword
  );
}

class UsernameParameters extends TextFormFieldParameters {
  UsernameParameters({
    required TextEditingController controller
  }) : super(
    label: TextFormFieldConstants.usernameLabel,
    hint: TextFormFieldConstants.usernameHint,
    obscureText: false,
    validator: (value) {
      return null;
    },
    controller: controller,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
      FilteringTextInputFormatter.singleLineFormatter
    ],
    keyboardType: TextInputType.visiblePassword
  );
}