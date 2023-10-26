part of 'login_bloc.dart';

abstract class LoginEvent {}

class GetLogin extends LoginEvent{
  String email;
  String password;

  GetLogin({required this.email, required this.password});
}