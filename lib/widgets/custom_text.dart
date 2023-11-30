import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final double fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.textHeightBehavior,
    this.selectionColor,
    required this.fontSize,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      strutStyle: strutStyle,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      selectionColor: selectionColor,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
