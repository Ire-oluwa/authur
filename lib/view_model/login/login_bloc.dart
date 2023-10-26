import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/model/network/network_helper.dart';
import 'package:untitled/model/responses/login_response.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // LoginBloc(super.initialState);
  late LoginResponse loginResponse;
  ApiCall apiCall;

  LoginBloc(this.apiCall) : super(LoginInitial()) {
    on<GetLogin>(
      (event, emit) async {
        emit(LoginLoading());

        try {
          loginResponse = await apiCall.signInUser(event.email, event.password);
          emit(LoginLoaded(loginResponse));
        } catch (e) {
          emit(LoginError(e.toString()));
        }
      },
    );
  }
}
