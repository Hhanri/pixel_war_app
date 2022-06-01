part of 'services_bloc.dart';

@immutable
abstract class ServicesEvent {}

class NoInternetEvent extends ServicesEvent {}

class YesInternetEvent extends ServicesEvent {}