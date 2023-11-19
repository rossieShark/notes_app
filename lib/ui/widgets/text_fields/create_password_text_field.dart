import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class CreatePasswordTextField extends StatefulWidget {
  const CreatePasswordTextField({
    super.key,
    required this.passwordController,
    required this.focusNode,
    required this.hintText,
  });
  final TextEditingController passwordController;
  final FocusNode focusNode;
  final String hintText;

  @override
  State<CreatePasswordTextField> createState() =>
      _CreatePasswordTextFieldState();
}

class _CreatePasswordTextFieldState extends State<CreatePasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: AuthTextField(
              obscureText: obscureText,
              focusNode: widget.focusNode,
              controller: widget.passwordController,
              hintText: widget.hintText,
            )),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(
              color: AppColors.white,
              !obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      const SizedBox(
        width: 4,
      )
    ]);
  }
}
