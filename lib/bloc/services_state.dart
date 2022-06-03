part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class LoadingState extends ServicesState {}

class NoInternetState extends ServicesState {}

class SignedInState extends ServicesState {}

class SignedOutState extends ServicesState {}

class NoProfileState extends ServicesState {}

class GoTrueErrorState extends ServicesState {
  final GotrueError error;

  GoTrueErrorState({required this.error});
}

class PostgrestErrorState extends ServicesState {
  final PostgrestError error;

  PostgrestErrorState({required this.error});
}

class ConfirmEmailState extends ServicesState {
  final String email;
  final String password;

  ConfirmEmailState({required this.email, required this.password});
}

class BannedProfileState extends ServicesState {}