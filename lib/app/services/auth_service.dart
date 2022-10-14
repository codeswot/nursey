import 'package:nursey/configs/configs.dart';

class AuthService {
  final _authInstance = FirebaseAuth.instance;

  User? get getCurrentUser => _authInstance.currentUser;

  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      final res = await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      if (res.user == null) {
        throw 'Try Again Later';
      }
      return res.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        throw 'This Account is Not Authorized';
      }

      throw e.message!;
    }
  }

  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final res = await _authInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      if (res.user == null) {
        throw 'Try Again Later';
      }
      return res.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An Error Occurred';
    }
  }

  signOut() {
    try {
      _authInstance.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
