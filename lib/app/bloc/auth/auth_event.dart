part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthSignIn extends AuthEvent {
  const AuthSignIn({required this.email, required this.password});
  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];
}

class AuthSignUp extends AuthEvent {
  const AuthSignUp({required this.email, required this.password});
  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];
}

class AuthSignOut extends AuthEvent {
  const AuthSignOut();

  @override
  List<Object?> get props => [];
}
