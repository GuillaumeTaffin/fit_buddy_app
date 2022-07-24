import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthPresenter extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthPresenter(this.authRepository) : super(authRepository.userSignedIn() ? Authenticated() : Anonymous()) {
    on<SignInEvent>(_handleSignIn);
  }

  void _handleSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    var status = await authRepository.signIn(event.email, event.password);
    if (status == AuthStatus.success) {
      emit(Authenticated());
    } else {
      emit(AuthFailed());
    }
  }
}
