part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class LoadingState extends ServicesState {}

class NoInternetState extends ServicesState {}

class SignedInState extends ServicesState {}

class SignedOutState extends ServicesState {}

class NoProfileState extends ServicesState {}

class ErrorState extends ServicesState {
  final GotrueError error;

  ErrorState({required this.error});
}

class ConfirmEmailState extends ServicesState {
  final String email;
  final String password;

  ConfirmEmailState({required this.email, required this.password});
}