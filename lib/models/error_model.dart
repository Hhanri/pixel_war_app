import 'package:flutter/material.dart';
import 'package:pixel_war_app/helpers/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@immutable
class ErrorModel {
  final String errorMessage;
  const ErrorModel({required this.errorMessage});

  factory ErrorModel.generate({required dynamic error}) {
    String errorMessage = "";
    if (error is GotrueError) {
      errorMessage = error.message;
    } else if (error is PostgrestError) {
      errorMessage = error.message;

    } else if (error is String) {
      errorMessage = error;
    } else {
      errorMessage = ErrorConstants.unknownError;
    }
    return ErrorModel(errorMessage: errorMessage);
  }
}