import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/model/elevated_button.dart';
import 'package:untitled/utils/constants.dart';
import 'package:untitled/view/login.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return kUnfocus(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kWhite,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 20.h, left: 20.w, right: 20.w, bottom: 14.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText("Welcome User", 32.sp, FontWeight.bold, kBlack),
                SizedBox(height: 30.h),
                _buildText("Sign up to join", 12.sp, FontWeight.bold, kGrey),
                SizedBox(height: 30.h),
                _buildName(),
                SizedBox(height: 15.h),
                _buildPhone(),
                SizedBox(height: 15.h),
                _buildEmail(),
                SizedBox(height: 15.h),
                _buildPassword(),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    _buildCheckButton(),
                    _buildText("I agree to the", 14.sp, FontWeight.w400, kGrey),
                    TextButton(
                      onPressed: () {},
                      child: _buildText(
                        "Terms of Service",
                        14.sp,
                        FontWeight.bold,
                        kBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildText(
                      "Have an account?",
                      14.sp,
                      FontWeight.w400,
                      kGrey,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child:
                          _buildText("Sign In", 14.sp, FontWeight.bold, kBlue),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.center,
                  child: CustomElevatedButton(
                    height: 40.h,
                    width: 320.w,
                    colour: kBlue,
                    click: () {},
                    child:
                        _buildText("Sign Up", 16.sp, FontWeight.w500, kWhite),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, double size, FontWeight weight, Color colour) {
    return Text(
      text,
      style: TextStyle(
        color: colour,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }

  Widget _buildName() {
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
        hintText: "Name",
      ),
    );
  }

  Widget _buildPhone() {
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
        hintText: "Phone",
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
          hintText: "Email"),
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
        hintText: "Password",
      ),
    );
  }

  Widget _buildCheckButton() {
    return Checkbox(
      value: true,
      onChanged: (value) {},
      shape: const CircleBorder(side: BorderSide()),
      activeColor: kGreen,
      checkColor: kWhite,
    );
  }
}
