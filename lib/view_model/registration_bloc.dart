// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled/view_model/registration_state.dart';
//
// class RegistrationBloc extends Cubit<RegistrationState>{
//   RegistrationBloc(super.initialState);
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   void onNameChanged(String value){
//     emit(RegistrationState(name: value));
//
//   }
//
//   void onPhoneChanged(String value){
//     emit(RegistrationState(phone: value));
//   }
//
//   void onEmailChanged(String value){
//     emit(RegistrationState(email: value));
//   }
//
//   void onPasswordChanged(String value){
//     emit(RegistrationState(password: value));
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on((event, emit) async {
      if (event is GetRegistration) {
        String value = validation(event);
        if (value != "") {
          emit (RegistrationError(value));
        } else {
          emit(RegistrationLoading());

          await Future.delayed(const Duration(seconds: 0), () async {
            //storing data in SharedPreferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('email', "${event.email}");
            prefs.setString('password', "${event.password}");
            emit(RegistrationLoaded());
          }).onError((error, stackTrace) {
            emit(RegistrationError(error.toString()));
          });
        }
      }
    });
  }
}


///validation for text field
String validation(GetRegistration data) {
  if (data.fullName?.isEmpty == true) {
    return 'Please enter Your full name';
  }
  if (data.email?.isEmpty == true) {
    return 'Please enter Your email-id';
  }
  if (data.password?.isEmpty == true) {
    return 'Please enter Your password';
  }
  if (data.phone?.isEmpty == true) {
    return 'Please enter Your contact Number';
  }
  return '';
}
