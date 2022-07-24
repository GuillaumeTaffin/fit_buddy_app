abstract class AuthRepository {
  bool userSignedIn();

  Future<AuthStatus> signIn(String email, String password);
}

enum AuthStatus {
  success,
  failure;
}
