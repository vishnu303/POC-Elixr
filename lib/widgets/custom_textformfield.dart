import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final bool enableInteractiveSelection;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final String? labelText;
  const CustomTextFormField({
    super.key,
    this.validator,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.style,
    this.enabled = true,
    this.strutStyle,
    this.textDirection,
    this.suffixIcon,
    this.obscureText = false,
    this.labelText,
    this.onChanged,
    this.focusNode,
    this.enableInteractiveSelection = true,
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
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        style: style,
        readOnly: readOnly,
        strutStyle: strutStyle,
        textDirection: textDirection,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        enableInteractiveSelection: enableInteractiveSelection,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.black,
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: Colors.black,
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
