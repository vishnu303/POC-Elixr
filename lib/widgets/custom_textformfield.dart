import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final bool obscureText;
  final String? labelText;
  const CustomTextFormField({
    super.key,
    this.validator,
    required this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    required this.obscureText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    var sWdith = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: kIsWeb ? sWdith * 0.2 : 20,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        style: style,
        strutStyle: strutStyle,
        textDirection: textDirection,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                color: Colors.indigo[500]!,
              )),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
