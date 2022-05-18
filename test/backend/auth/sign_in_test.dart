import 'package:bloc_test/bloc_test.dart';
import 'package:fit_buddy_app/backend/auth/auth_bloc.dart';
import 'package:fit_buddy_app/backend/auth/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'User is initially anonymous',
    () {
      var bloc = AuthBloc(AuthRepositoryInMemory());
      expect(bloc.state, isA<Anonymous>());
    },
  );

  test(
    'User is initially signed in',
    () {
      var bloc = AuthBloc(AuthRepositoryInMemory()..withUserSignedIn());
      expect(bloc.state, isA<Authenticated>());
    },
  );

  blocTest<AuthBloc, AuthState>(
    'Successful sign in states',
    build: () => AuthBloc(AuthRepositoryInMemory()),
    act: (bloc) {
      bloc.add(SignInEvent(email: 'toto@gmail.com', password: 'toto1234'));
    },
    expect: () => [AuthLoading(), Authenticated()],
  );

  blocTest<AuthBloc, AuthState>(
    'Failing sign in states',
    build: () => AuthBloc(AuthRepositoryInMemory()..reject('toto@gmail.com')),
    act: (bloc) {
      bloc.add(SignInEvent(email: 'toto@gmail.com', password: 'toto1234'));
    },
    expect: () => [AuthLoading(), AuthFailed()],
  );
}

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
