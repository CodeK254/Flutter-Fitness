// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:try_state/app/widgets/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? fontSize;
  FontWeight? fontWeight;
  double? letterSpacing;
  TextAlign? textAlign;
  Color? color;
  TextDecoration? textDecoration;
  TextOverflow? textOverflow;
  CustomText({super.key, required this.text, this.textOverflow, this.color, this.fontSize, this.fontWeight, this.letterSpacing, this.textAlign, this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing ?? 1.0,
        color: color ?? blackCustom,
        decoration: textDecoration ?? TextDecoration.none,
      ),
      textAlign: TextAlign.left,
      overflow: textOverflow ?? TextOverflow.visible,
    );
  }
}