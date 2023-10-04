import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.colour,
      required this.weight,
      required this.size});

  final String text;
  final Color colour;
  final FontWeight weight;
  final double size;

  @override
  Widget build(BuildContext context) {
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
