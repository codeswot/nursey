part of 'auth_bloc.dart';

enum AuthStatus { initial, unAuthenticated, authenticated, error, loading }

extension AuthStatusX on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isUnAuthenticated => this == AuthStatus.unAuthenticated;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isError => this == AuthStatus.error;
  bool get isLoading => this == AuthStatus.loading;
}

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.exception,
  });

  final User? user;
  final String? exception;
  final AuthStatus status;

  AuthState copyWith({
    User? user,
    AuthStatus? status,
    String? exception,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [user, exception, status];
}
