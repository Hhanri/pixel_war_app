import 'package:flutter/material.dart';

class MessageTextWidget extends StatelessWidget {
  final String text;
  const MessageTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}
