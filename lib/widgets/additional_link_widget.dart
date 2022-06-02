import 'package:flutter/material.dart';

class AdditionalLinkWidget extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;
  const AdditionalLinkWidget({
    Key? key,
    required this.text,
    required this.linkText,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(text),
        TextButton(
          onPressed: onTap,
          child: Text(linkText)
        )
      ],
    );
  }
}
