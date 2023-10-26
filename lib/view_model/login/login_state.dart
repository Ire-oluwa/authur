

part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginResponse loginResponse;

  LoginLoaded(this.loginResponse);
}

class LoginError extends LoginState {
  String? error;

  LoginError(this.error);
}