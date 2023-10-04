import 'package:flutter/material.dart';

//colors
const kBlue = Colors.blue;
const kBlack = Colors.black;
const kGrey = Colors.grey;
const kBlueGrey = Colors.blueGrey;
const kWhite = Colors.white;
const kTransparent = Colors.transparent;
const kGreen = Colors.green;

//DISMISS KEYBOARD(the highest widget in the tree)
Widget kUnfocus({child}) => GestureDetector(
  behavior: HitTestBehavior.translucent,
  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
  child: child,
);