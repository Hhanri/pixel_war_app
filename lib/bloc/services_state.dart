part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class NoInternetState extends ServicesState{}

class YesInternetState extends ServicesState{}