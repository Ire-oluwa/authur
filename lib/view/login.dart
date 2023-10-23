import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/model/custom_text.dart';
import 'package:untitled/model/elevated_button.dart';
import 'package:untitled/utils/constants.dart';
import 'package:untitled/utils/strings.dart';
import 'package:untitled/view/registration.dart';
import 'package:untitled/view_model/registration_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.registrationBloc});

  final RegistrationBloc registrationBloc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: kUnfocus(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: Strings.welcomeBack,
                  colour: kBlack,
                  weight: FontWeight.bold,
                  size: 32.sp,
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text: Strings.continueSignIn,
                  colour: kGrey,
                  weight: FontWeight.bold,
                  size: 12.sp,
                ),
                SizedBox(height: 30.h),
                _buildEmail(),
                SizedBox(height: 15.h),
                _buildPassword(),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: Strings.forgotPassword,
                    colour: kBlack,
                    weight: FontWeight.w500,
                    size: 14.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: Strings.createAccount,
                      size: 14.sp,
                      weight: FontWeight.w400,
                      colour: kGrey,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  RegistrationScreen(bloc:registrationBloc),
                          ),
                        );
                      },
                      child: CustomText(
                        text: Strings.signUp,
                        size: 14.sp,
                        weight: FontWeight.bold,
                        colour: kBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 280.h),
                Align(
                  alignment: Alignment.center,
                  child: CustomElevatedButton(
                    height: 40.h,
                    width: 320.w,
                    colour: kBlue,
                    click: () => Navigator.of(context).pushNamed('/main'),
                    child: CustomText(
                      text: Strings.signIn,
                      colour: kWhite,
                      weight: FontWeight.w500,
                      size: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return TextField(
      cursorColor: kBlack,
      decoration: InputDecoration(
          filled: true,
          fillColor: kBlack.withOpacity(0.1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kBlack),
            borderRadius: BorderRadius.circular(20.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
          hintText: Strings.email),
    );
  }

  Widget _buildPassword() {
    return TextField(
      cursorColor: kBlack,
      decoration: InputDecoration(
        filled: true,
        fillColor: kBlack.withOpacity(0.1),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kBlack),
          borderRadius: BorderRadius.circular(20.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r),
        ),
        hintText: Strings.password,
      ),
    );
  }
}
