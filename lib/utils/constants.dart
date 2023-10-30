import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//colors
const kBlue = Colors.blue;
const kBlack = Colors.black;
const kGrey = Colors.grey;
const kBlueGrey = Colors.blueGrey;
const kWhite = Colors.white;
const kTransparent = Colors.transparent;
const kGreen = Colors.green;
const kRed = Colors.red;

//DISMISS KEYBOARD(the highest widget in the tree)
Widget kUnfocus({child}) => GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );

//Keyboard Type
const kNameCapitalization = TextCapitalization.words;
const kNameType = TextInputType.text;
const kEmailType = TextInputType.emailAddress;
const kNumberType = TextInputType.number;
const kPasswordType = TextInputType.visiblePassword;

//text input formatters
final kNameFormatter = [
  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
];
final kNumberFormatter = [FilteringTextInputFormatter.digitsOnly];
final kEmailFormatter = [
  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z@0-9._]'))
];

final kPasswordFormatter = [
  FilteringTextInputFormatter.allow(RegExp(('[a-zA-Z0-9_|#@!*?+%]'))),
];

final kTextFormatter = [
  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]')),
];

//text input action
const TextInputAction kActionNext = TextInputAction.next;
