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