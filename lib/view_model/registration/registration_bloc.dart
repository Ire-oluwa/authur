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
import 'package:untitled/model/network/network_helper.dart';
import 'package:untitled/model/responses/registration_response.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationResponse? registrationResponse;
  ApiCall apiCall;

  RegistrationBloc(this.apiCall) : super(RegistrationInitial()) {
    on<GetRegistration>((event, emit) async {
      emit(RegistrationLoading());

      try {
        registrationResponse = await apiCall.createUser(
          event.fullName,
          event.email,
          event.phone,
          event.password,
        );
        emit(RegistrationLoaded(registrationResponse!));
      }
      catch (e) {
        emit (RegistrationError(e.toString()));
      }
    });
  }
}


