import 'package:bloc_test/bloc_test.dart';
import 'package:fit_buddy_app/auth/presentation/presenter/auth_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../auth_repository_in_memory.dart';
import '../test_app_context.dart';

void main() {
  group('Unauthenticated user has to sign in', () {
    final state = TestAppContext().authPresenter.state;

    group('Static display data', () {
      test('Page title', () => expect(state.pageTitle, 'WELCOME TO FIT-BUDDY'));
      test('Email label', () => expect(state.emailLabel, 'E-MAIL'));
      test('Password label', () => expect(state.passwordLabel, 'PASSWORD'));
      test('Password field is obfuscated', () => expect(state.isPasswordObfuscated, true));
      test('Logo image resource', () => expect(state.appLogo, 'images/logo512.png'));
    });

    test('User is invited to sign in y default', () => expect(state.submitActionLabel, 'SIGN IN'));

    test('User is initially anonymous', () => expect(state, isA<Anonymous>()));
  });

  test(
    'User is initially signed in',
    () {
      var context = TestAppContext(authRepository: AuthRepositoryInMemory()..withUserSignedIn());
      expect(context.authPresenter.state, isA<Authenticated>());
    },
  );

  blocTest<AuthPresenter, AuthState>(
    'Successful sign in states',
    build: () => TestAppContext(authRepository: AuthRepositoryInMemory()).authPresenter,
    act: (bloc) => bloc.add(SignInEvent(email: 'toto@gmail.com', password: 'toto1234')),
    expect: () => [AuthLoading(), Authenticated()],
  );

  blocTest<AuthPresenter, AuthState>(
    'Failing sign in states',
    build: () => TestAppContext(authRepository: AuthRepositoryInMemory()..reject('toto@gmail.com')).authPresenter,
    act: (bloc) => bloc.add(SignInEvent(email: 'toto@gmail.com', password: 'toto1234')),
    expect: () => [AuthLoading(), AuthFailed()],
  );
}
