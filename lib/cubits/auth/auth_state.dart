part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSessionExists extends AuthState {}

class AuthSessionDoesNotExists extends AuthState {}

class AuthCodeSent extends AuthState {
  AuthCodeSent();
}

class AuthLoggedIn extends AuthState {
  AuthLoggedIn();
}

class AuthLoggedOut extends AuthState {}

class AuthUserNotFound extends AuthState {
  final String phone;
  AuthUserNotFound(this.phone);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
