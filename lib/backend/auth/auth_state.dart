part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class Anonymous extends AuthState {}

@immutable
class AuthLoading extends AuthState {}

@immutable
class Authenticated extends AuthState {}

@immutable
class AuthFailed extends AuthState {}
