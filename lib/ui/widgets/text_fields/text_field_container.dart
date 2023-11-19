import 'package:flutter/material.dart';
import 'package:notes_app/ui/screens/add_screen/text_fields/start_time_text_field.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {super.key,
      required TextEditingController controller,
      required this.label,
      this.initialDate})
      : _controller = controller;

  final TextEditingController _controller;
  final String label;
  final DateTime? initialDate;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width / 2 - 50,
        color: Colors.transparent,
        child: StartEndTimeTextField(
          labelText: label,
          initialDate: initialDate ?? DateTime.now(),
          controller: _controller,
        ));
  }
}
