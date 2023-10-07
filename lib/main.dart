import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view/login.dart';
import 'package:untitled/view/main_screen.dart';
import 'package:untitled/view/registration.dart';
import 'package:untitled/view/splash.dart';
import 'package:untitled/view_model/registration_bloc.dart';
import 'package:untitled/view_model/registration_state.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  final registrationState = RegistrationState();
  runApp( MyApp(registrationBloc: RegistrationBloc(registrationState),));
}

class MyApp extends StatelessWidget {
   MyApp({super.key, required this.registrationBloc});
  final registrationState = RegistrationState();
  final RegistrationBloc registrationBloc;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          routes: {
            '/registration': (context) =>  RegistrationScreen(bloc:
        RegistrationBloc(registrationState),),
            '/login': (context) =>  LoginScreen(registrationBloc:
            RegistrationBloc(registrationState)),
            '/main': (context) => const MainScreen(),
          },
        );
      },
    );
  }
}
