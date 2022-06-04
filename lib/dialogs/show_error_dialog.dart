import 'package:flutter/material.dart' show BuildContext;
import 'package:pixel_war_app/dialogs/generic_dialog.dart';
import 'package:pixel_war_app/models/error_model.dart';

Future<void> showErrorModel({
  required ErrorModel errorModel,
  required BuildContext context,
}) {
  return showGenericDialog<void>(
    context: context,
    title: "error",
    content: errorModel.errorMessage,
    optionsBuilder: () => {
      'OK': true,
    },
  );
}