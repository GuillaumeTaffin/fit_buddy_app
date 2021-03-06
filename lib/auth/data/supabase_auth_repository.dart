import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/auth_repository.dart';

class AuthRepositorySupabase extends AuthRepository {
  @override
  Future<AuthStatus> signIn(String email, String password) async {
    final response = await Supabase.instance.client.auth.signIn(email: email, password: password);
    if (response.error == null) {
      return AuthStatus.success;
    } else {
      return AuthStatus.failure;
    }
  }

  @override
  bool userSignedIn() {
    var user = Supabase.instance.client.auth.user();
    return user == null ? false : true;
  }
}
