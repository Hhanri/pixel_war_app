part of 'services_bloc.dart';

@immutable
abstract class ServicesState extends Equatable {
  final bool isLoading;
  final ErrorModel? errorModel;

  const ServicesState({required this.isLoading, this.errorModel});
}

class NoInternetState extends ServicesState {
  const NoInternetState({required super.isLoading});

  @override
  List<Object?> get props => [isLoading, errorModel];
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

  @override
  // TODO: implement props
  List<Object?> get props => [hasProfile, isBanned, user, errorModel, isLoading];
}

class SignedOutState extends ServicesState {
  const SignedOutState({required super.isLoading, super.errorModel});

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, errorModel];
}

class ConfirmEmailState extends ServicesState {
  final String email;
  final String password;

  const ConfirmEmailState({
    required super.isLoading,
    required this.email,
    required this.password
  });

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, email, password, errorModel];
}