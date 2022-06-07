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

class ThrowConfirmEmailEvent extends ServicesEvent {
  final String email;
  final String password;

  ThrowConfirmEmailEvent({required this.email, required this.password});
}

class CheckProfileStateEvent extends ServicesEvent {}

class CreateProfileEvent extends ServicesEvent {
  final String username;

  CreateProfileEvent({required this.username});
}

class AppInitializeEvent extends ServicesEvent {}

class PutPixelEvent extends ServicesEvent {
  final int row;
  final int col;
  final String color;
  PutPixelEvent({required this.row, required this.col, required this.color});
}