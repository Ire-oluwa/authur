import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.colour,
    required this.click,
  });

  final double height;
  final double width;
  final Widget child;
  final Color colour;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colour,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
