import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/model/elevated_button.dart';
import 'package:untitled/utils/constants.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding:
               EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w, bottom: 14.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText("Welcome User", 32.sp, FontWeight.bold, kBlack),
              _buildText("Sign up to join", 12.sp, FontWeight.bold, kGrey),
              SizedBox(height: 100.h,),
              Align(
                alignment: Alignment.center,
                child: CustomElevatedButton(
                  height: 40.h,
                  width: 320.w,
                  colour: kBlue,
                  click: (){},
                  child: _buildText("Sign Up", 16.sp, FontWeight.w500, kWhite),
                ),
              ),
            ],
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
}
