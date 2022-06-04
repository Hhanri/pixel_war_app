part of 'services_bloc.dart';

@immutable
abstract class ServicesState {
  final bool isLoading;
  final ErrorModel? errorModel;

  const ServicesState({required this.isLoading, this.errorModel});
}

class NoInternetState extends ServicesState {
  const NoInternetState({required super.isLoading});
}

class SignedInState extends ServicesState {
  final bool hasProfile;
  final bool isBanned;
  final User user;
  const SignedInState({
    required super.isLoading,
    required this.hasProfile,
    required this.isBanned,
    required this.user,
    super.errorModel
  });
}

class SignedOutState extends ServicesState {
  const SignedOutState({required super.isLoading, super.errorModel});
}

class ConfirmEmailState extends ServicesState {
  final String email;
  final String password;

  const ConfirmEmailState({
    required super.isLoading,
    required this.email,
    required this.password
  });

}