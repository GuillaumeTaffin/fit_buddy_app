part of 'auth_presenter.dart';

@immutable
abstract class AuthEvent {}

@immutable
class SignInEvent extends AuthEvent {
  final String email;
  final String password;

//<editor-fold desc="Data Methods">

  SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignInEvent && runtimeType == other.runtimeType && email == other.email && password == other.password);

  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'SignInEvent{ email: $email, password: $password,}';
  }

  SignInEvent copyWith({
    String? email,
    String? password,
  }) {
    return SignInEvent(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignInEvent.fromMap(Map<String, dynamic> map) {
    return SignInEvent(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
