import 'package:fit_buddy_app/backend/auth/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'User is initially anonymous',
    () {
      var bloc = AuthBloc();
      expectLater(bloc.state.authStatus, AuthStatus.anonymous);
    },
  );
}
