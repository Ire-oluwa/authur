
import 'package:flutter/material.dart';

// part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class GetRegistration extends RegistrationEvent {
  String? fullName;
  String? email;
  String? phone;
  String? password;

  GetRegistration({this.fullName, this.email, this.phone, this.password});
}