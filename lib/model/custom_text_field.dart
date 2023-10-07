import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hint, required this.onChanged, required this.inputType, required this.formatter, required this.controller,
  });

  final String hint;
  final void Function(String) onChanged;
  final TextInputType inputType;
  final List<TextInputFormatter> formatter;
  final TextEditingController controller;



  @override
  Widget build(BuildContext context) {
    return TextField(
    cursorColor: kBlack,
    onChanged: onChanged,
    keyboardType: inputType,
    inputFormatters: formatter,
    controller: controller,
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
      hintText: hint,
    ),
      );
  }
}