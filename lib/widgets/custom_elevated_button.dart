import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus = false;
  final Clip clipBehavior = Clip.none;
  final MaterialStatesController? statesController;
  final EdgeInsetsGeometry? padding;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.focusNode,
    this.statesController,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 140),
      ),
      focusNode: focusNode,
      statesController: statesController,
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      onHover: onHover,
      child: child,
    );
  }
}
