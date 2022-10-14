import 'package:nursey/app/services/auth_service.dart';
import 'package:nursey/configs/configs.dart';

class AuthRepository {
  const AuthRepository(this._service);
  final AuthService _service;

  Future<User?> getAuthUser() async => _service.getCurrentUser;

  Future<User?> signIn(
          {required String email, required String password}) async =>
      _service.signIn(email: email, password: password);

  Future<User?> signUp(
          {required String email, required String password}) async =>
      _service.signUp(email: email, password: password);

  Future<User?> signOut() async => _service.signOut();
}
