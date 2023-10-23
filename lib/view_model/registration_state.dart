// class RegistrationState {
//   RegistrationState({this.name = "", this.phone = "", this.email = "", this.password = ""});
//
//   final String name;
//   final String phone;
//   final String email;
//   final String password;
// }

part of 'registration_bloc.dart';

// import 'package:flutter/material.dart';

// @immutable

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationLoaded extends RegistrationState {}

class RegistrationValidation extends RegistrationState {
  String? value;

  RegistrationValidation(this.value);
}

class RegistrationError extends RegistrationState {
  String? error;

  RegistrationError(this.error);
}
