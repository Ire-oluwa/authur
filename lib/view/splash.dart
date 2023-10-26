import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utils/constants.dart';
import 'package:untitled/view/registration.dart';
import 'package:untitled/view_model/registration/registration_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  ///Animation
  late AnimationController controller;
  late Animation<double> animation;
  late RegistrationBloc registrationBloc;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    final curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    controller.repeat(reverse: true);

    Future.delayed(const Duration(seconds: 8)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const RegistrationScreen()),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlueGrey,
        body: Center(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0.w, -100.h * animation.value),
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: kBlue.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
