import 'package:nursey/app/repository/auth_repository.dart';
import 'package:nursey/configs/configs.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  AuthBloc(this._repository) : super(const AuthState()) {
    on<AuthSignIn>(_onSignIn);
    on<AuthSignUp>(_onSignUp);
    on<AuthSignOut>(_onSignOut);
  }

  void _onSignIn(AuthSignIn events, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final user = await _repository.signIn(
          email: events.email, password: events.password);
      emit(state.copyWith(status: AuthStatus.authenticated, user: user));
    } catch (e) {
      emit(state.copyWith(exception: e.toString(), status: AuthStatus.error));
    }
  }

  void _onSignUp(AuthSignUp events, Emitter<AuthState> emit) {}
  void _onSignOut(AuthSignOut events, Emitter<AuthState> emit) {}
}
