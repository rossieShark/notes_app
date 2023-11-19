import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonText;
  final Widget? child;
  final double width;
  final Color color;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      this.buttonText,
      this.child,
      double? width,
      this.color = AppColors.redBrown})
      : width = width ?? 180,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: TextButton(
            onPressed: onPressed,
            child: child ??
                Text(
                  buttonText ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                )));
  }
}
