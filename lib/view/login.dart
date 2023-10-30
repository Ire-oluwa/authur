import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/model/repository/res_google_sign_in.dart';
import 'package:untitled/utils/custom_text.dart';
import 'package:untitled/utils/custom_text_field.dart';
import 'package:untitled/utils/elevated_button.dart';
import 'package:untitled/utils/constants.dart';
import 'package:untitled/utils/strings.dart';
import 'package:untitled/view/registration.dart';
import 'package:untitled/view_model/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
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
                            builder: (context) => const RegistrationScreen(),
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
    return CustomTextField(
      hint: Strings.email,
      inputType: kEmailType,
      formatter: kEmailFormatter,
      onChanged: (value) {},
      controller: _email,
    );
  }

  Widget _buildPassword() {
    return CustomTextField(
      hint: Strings.password,
      controller: _password,
      onChanged: (value) {},
      inputType: kPasswordType,
      formatter: kPasswordFormatter,
    );
  }

  void _googleSignIn({required BuildContext context}) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      String? token = googleAuth.idToken;

      ResGoogleSignInModel socialMediaUser = ResGoogleSignInModel(
        googleUser.displayName,
        googleUser.email,
        googleUser.photoUrl,
        googleUser.id,
        token,
      );

      Fluttertoast.showToast(msg: googleUser.email, backgroundColor: kBlue,
        textColor: kWhite);
    } catch (error) {
      print("Google Sign-In Error: $error");

      Fluttertoast.showToast(
          msg: "Google Sign-In Failed. Please try again later.",
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }
}
