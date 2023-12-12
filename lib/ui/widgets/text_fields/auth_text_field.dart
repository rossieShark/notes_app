import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';

import 'package:notes_app/ui/widgets/widgets_index.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final bool obscureText;
  final double width;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.focusNode,
    this.width = 400,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: widget.width,
        height: 45,
        decoration: const BoxDecoration(color: AppColors.white),
        child: TextField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          cursorColor: AppColors.pink,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontSize: 10,
                color: Colors.grey,
                height: 2.5,
                fontFamily: AppFonts.versailles.font),
            labelStyle: const TextStyle(color: AppColors.white),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: widget.controller.text.isNotEmpty
                    ? AppColors.white
                    : Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: AppColors.white),
            ),
            suffixIcon:
                widget.controller.text.isNotEmpty && widget.focusNode.hasFocus
                    ? IconButtonWidget(
                        iconData: Icons.clear,
                        color: AppColors.pink,
                        onPressed: () {
                          setState(() {
                            widget.controller.clear();
                          });
                        },
                      )
                    : null,
          ),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
