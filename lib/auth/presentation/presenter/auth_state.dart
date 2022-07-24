part of 'auth_presenter.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];

  String get pageTitle => 'WELCOME TO FIT-BUDDY';

  String get emailLabel => 'E-MAIL';

  String get passwordLabel => 'PASSWORD';

  bool get isPasswordObfuscated => true;

  String get submitActionLabel => 'SIGN IN';

  String get appLogo => 'images/logo512.png';
}

@immutable
class Anonymous extends AuthState {}

@immutable
class AuthLoading extends AuthState {}

@immutable
class Authenticated extends AuthState {}

@immutable
class AuthFailed extends AuthState {}
