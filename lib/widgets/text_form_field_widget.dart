import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?) validator;
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
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
