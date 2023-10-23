import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/view/login.dart';
import 'package:untitled/view/main_screen.dart';
import 'package:untitled/view/registration.dart';
import 'package:untitled/view/splash.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  // final registrationState = RegistrationState();
  runApp( const MyApp());
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
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          routes: {
            '/registration': (context) =>  const RegistrationScreen(),
            '/login': (context) =>  const LoginScreen(),
            '/main': (context) => const MainScreen(),
          },
        );
      },
    );
  }
}
