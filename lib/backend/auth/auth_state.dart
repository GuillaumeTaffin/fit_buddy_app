part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  get authStatus;
}

class AuthInitial extends AuthState {
  @override
  final authStatus = AuthStatus.anonymous;
}

enum AuthStatus { anonymous, authenticated }
