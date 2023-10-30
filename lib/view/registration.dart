import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utils/alert_dialog.dart';
import 'package:untitled/utils/custom_text_field.dart';
import 'package:untitled/utils/constants.dart';
import 'package:untitled/utils/strings.dart';
import 'package:untitled/view/login.dart';
import 'package:untitled/view/main_screen.dart';
import 'package:untitled/view_model/registration/registration_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    super.key,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  late RegistrationBloc registrationBloc;

  @override
  void initState() {
    super.initState();
    registrationBloc = BlocProvider.of<RegistrationBloc>(context);
  }

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
                _buildText(Strings.welcome, 32.sp, FontWeight.bold, kBlack),
                SizedBox(height: 30.h),
                _buildText(
                    Strings.signUpSubtitle, 12.sp, FontWeight.bold, kGrey),
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
                    _buildText(Strings.agree, 14.sp, FontWeight.w400, kGrey),
                    TextButton(
                      onPressed: () {},
                      child: _buildText(
                        Strings.terms,
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
                      Strings.haveAnAccount,
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
                      child: _buildText(
                          Strings.signIn, 14.sp, FontWeight.bold, kBlue),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                BlocConsumer<RegistrationBloc, RegistrationState>(
                    listener: (context, state) {
                  if (state is RegistrationLoaded
                      && state.registrationResponse.message.isNotEmpty
                      ) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: Strings.regSuccess,
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            ),
                            child: const Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  } else if (state is RegistrationError) {
                    final message = state.error;
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: Strings.regError,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "$message",
                              textAlign: TextAlign.justify,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }, builder: (context, state) {
                  if (state is RegistrationLoading) {
                    Future.delayed(const Duration(seconds: 2));
                    return const CircularProgressIndicator();
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          registrationBloc.add(
                            GetRegistration(
                                fullName: fullName.text,
                                email: email.text,
                                phone: phone.text,
                                password: password.text),
                          );
                          print(registrationBloc.registrationResponse?.message
                              .toString());
                        },
                        child: Container(
                          height: 40.h,
                          width: 320.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kBlue,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child:
                              BlocBuilder<RegistrationBloc, RegistrationState>(
                            bloc: registrationBloc,
                            builder: (BuildContext context, state) {
                              if (state is RegistrationLoading) {
                                return const CircularProgressIndicator();
                              } else {
                                return _buildText(
                                  Strings.signUp,
                                  16.sp,
                                  FontWeight.w500,
                                  kWhite,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // final RegistrationBloc bloc;
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
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      // bloc: RegistrationBloc(registrationState),
      builder: (context, state) {
        return CustomTextField(
          hint: Strings.name,
          onChanged: (value) {},
          controller: TextEditingController(),
          formatter: kNameFormatter,
          inputType: kNameType,
        );
      },
    );
  }

  Widget _buildPhone() {
    return CustomTextField(
      hint: Strings.phone,
      onChanged: (value) {},
      inputType: kNumberType,
      formatter: kNumberFormatter,
      controller: phone,
      maxLength: 11,
    );
  }

  Widget _buildEmail() {
    return CustomTextField(
      hint: Strings.email,
      inputType: kEmailType,
      controller: email,
      onChanged: (value) {},
      formatter: kEmailFormatter,
    );
  }

  Widget _buildPassword() {
    return CustomTextField(
      hint: Strings.password,
      onChanged: (value) {},
      controller: password,
      inputType: kPasswordType,
      formatter: kPasswordFormatter,
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
