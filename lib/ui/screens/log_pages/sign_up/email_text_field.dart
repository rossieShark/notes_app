import 'package:flutter/material.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class EmailTextFields extends StatelessWidget {
  final TextEditingController signUpTextController;
  final FocusNode focusNode;
  const EmailTextFields(
      {super.key, required this.signUpTextController, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: AuthTextField(
        obscureText: false,
        focusNode: focusNode,
        controller: signUpTextController,
        hintText: 'Enter email',
      ),
    );
  }
}
