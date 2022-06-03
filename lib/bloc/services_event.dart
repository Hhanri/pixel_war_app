part of 'services_bloc.dart';

@immutable
abstract class ServicesEvent {}

class NoInternetEvent extends ServicesEvent {}

class YesInternetEvent extends ServicesEvent {}

class SignInEvent extends ServicesEvent {
  final String? email;
  final String? password;

  SignInEvent({this.email, this.password});
}

class SignOutEvent extends ServicesEvent {}

class SignUpEvent extends ServicesEvent {
  final String email;
  final String password;
  SignUpEvent({required this.email, required this.password});
}

class ThrowGoTrueErrorEvent extends ServicesEvent {
  final GotrueError error;

  ThrowGoTrueErrorEvent({required this.error});
}

class ThrowPostgrestErrorEvent extends ServicesEvent {
  final PostgrestError error;

  ThrowPostgrestErrorEvent({required this.error});
}

class ThrowConfirmEmailEvent extends ServicesEvent {
  final String email;
  final String password;

  ThrowConfirmEmailEvent({required this.email, required this.password});
}

class CheckProfileStateEvent extends ServicesEvent {}

class LoadBannedProfileEvent extends ServicesEvent {}

class LoadNoProfileEvent extends ServicesEvent {}

class LoadSignedInEvent extends ServicesEvent {}

class CreateProfileEvent extends ServicesEvent {
  final String username;

  CreateProfileEvent({required this.username});
}