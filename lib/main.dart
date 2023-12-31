import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/model/network/network_helper.dart';
import 'package:untitled/view/login.dart';
import 'package:untitled/view/main_screen.dart';
import 'package:untitled/view/registration.dart';
import 'package:untitled/view/splash.dart';
import 'package:untitled/view_model/login/login_bloc.dart';
import 'package:untitled/view_model/registration/registration_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) async => await ScreenUtil.ensureScreenSize());

  // final registrationState = RegistrationState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RegistrationBloc(ApiCall())),
            BlocProvider(create: (context) => LoginBloc(ApiCall())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            routes: {
              '/registration': (context) => const RegistrationScreen(),
              '/login': (context) => const LoginScreen(),
              '/main': (context) => const MainScreen(),
            },
          ),
        );
      },
    );
  }
}
