import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';

import 'package:notes_app/ui/widgets/widgets_index.dart';

class DescriptionTextField extends StatefulWidget {
  const DescriptionTextField(
      {super.key,
      required this.controller,
      this.labelText = 'Description',
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.labelStyle});
  final TextEditingController controller;
  final String labelText;
  final Color? enabledBorderColor;
  final TextStyle? labelStyle;
  final Color? focusedBorderColor;
  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  late FocusNode _focusNode;

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    widget.controller.addListener(() {
      setState(() {});
    });
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
    context.read<TextFieldBloc>().add(TextFieldControllerAddedEvent(
        widget.controller, AppData().descriptionTextField));
  }

  @override
  void dispose() {
    widget.controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      labelText: widget.labelText,
      padding: 20,
      labelStyle: widget.labelStyle ?? Theme.of(context).textTheme.labelMedium,
      enabledBorderColor: widget.enabledBorderColor ?? AppColors.white,
      focusedBorderColor: widget.focusedBorderColor ?? AppColors.redBrown,
      hasFocus: _hasFocus,
      maxLines: 4,
      focusNode: _focusNode,
      suffixIcon: widget.controller.text.isNotEmpty && _focusNode.hasFocus
          ? IconButtonWidget(
              iconData: Icons.clear,
              color: AppColors.yellow,
              onPressed: () {
                setState(() {
                  widget.controller.clear();
                });
              },
            )
          : null,
      onChanged: (value) {
        context.read<TextFieldBloc>().add(TextFieldControllerTextChangedEvent(
            widget.controller, value, AppData().descriptionTextField));
      },
    );
  }
}
