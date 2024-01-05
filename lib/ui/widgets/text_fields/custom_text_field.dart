import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hasFocus,
    required this.focusNode,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.labelStyle,
    this.padding = 15,
    this.enabledBorderColor = AppColors.white,
    this.focusedBorderColor = AppColors.redBrown,
    this.onChanged,
  });
  final TextEditingController controller;
  final String labelText;
  final bool hasFocus;
  final FocusNode focusNode;
  final Widget? suffixIcon;
  final bool readOnly;
  final int maxLines;
  final TextStyle? labelStyle;
  final double padding;

  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final void Function(String)? onChanged;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        textInputAction: TextInputAction.go,
        cursorColor: AppColors.green,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.enabledBorderColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.focusedBorderColor),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.enabledBorderColor),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.focusedBorderColor),
          ),
          labelText: widget.labelText,
          errorText: context
                      .watch<TextFieldBloc>()
                      .state
                      .controllers[widget.labelText]
                      ?.isValid ??
                  true
              ? ''
              : context
                      .watch<TextFieldBloc>()
                      .state
                      .controllers[widget.labelText]!
                      .controller
                      .text
                      .isNotEmpty
                  ? null // Set error text to null when text field is changed
                  : 'Empty field',
          contentPadding: EdgeInsets.symmetric(vertical: widget.padding),
          suffixIcon: widget.suffixIcon,
          hintText: widget.focusNode.hasFocus ? '' : widget.labelText,
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle:
              widget.labelStyle ?? Theme.of(context).textTheme.labelLarge,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        onChanged: (value) => widget.onChanged,
        focusNode: widget.focusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
        style: Theme.of(context).textTheme.labelSmall);
  }
}
