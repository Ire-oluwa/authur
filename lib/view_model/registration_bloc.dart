import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view_model/registration_state.dart';

class RegistrationBloc extends Cubit<RegistrationState>{
  RegistrationBloc(super.initialState);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onNameChanged(String value){
    emit(RegistrationState(name: value));

  }

  void onPhoneChanged(String value){
    emit(RegistrationState(phone: value));
  }

  void onEmailChanged(String value){
    emit(RegistrationState(email: value));
  }

  void onPasswordChanged(String value){
    emit(RegistrationState(password: value));
  }
}