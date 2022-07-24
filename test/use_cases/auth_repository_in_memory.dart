import 'package:fit_buddy_app/auth/domain/auth_repository.dart';

class AuthRepositoryInMemory implements AuthRepository {
  final _rejectedUsers = <String>[];
  var _userSignedIn = false;

  @override
  Future<AuthStatus> signIn(String email, String password) async {
    var userRejected = _rejectedUsers.any((element) => element == email);
    if (userRejected) {
      return AuthStatus.failure;
    } else {
      return AuthStatus.success;
    }
  }

  @override
  bool userSignedIn() {
    return _userSignedIn;
  }

  void reject(String email) {
    _rejectedUsers.add(email);
  }

  void withUserSignedIn() {
    _userSignedIn = true;
  }
}
