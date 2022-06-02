part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class LoadingState extends ServicesState {}

class NoInternetState extends ServicesState {}

class SignedInState extends ServicesState {}

class SignedOutState extends ServicesState {}

class NoProfileState extends ServicesState {}