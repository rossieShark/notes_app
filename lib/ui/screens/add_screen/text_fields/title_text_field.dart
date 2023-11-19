import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class TitleTextField extends StatefulWidget {
  const TitleTextField(
      {super.key, required this.controller, this.labelText = "Title"});
  final TextEditingController controller;
  final String labelText;
  @override
  State<TitleTextField> createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
    context.read<TextFieldBloc>().add(
        TextFieldControllerAddedEvent(widget.controller, widget.labelText));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      labelText: widget.labelText,
      focusNode: _focusNode,
      hasFocus: _hasFocus,
      suffixIcon: widget.controller.text.isNotEmpty && _focusNode.hasFocus
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
      onChanged: (value) {
        context.read<TextFieldBloc>().add(TextFieldControllerTextChangedEvent(
            widget.controller, value, widget.labelText));
      },
    );
  }
}
