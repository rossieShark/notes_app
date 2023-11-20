import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class StartEndTimeTextField extends StatefulWidget {
  const StartEndTimeTextField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.initialDate,
  });
  final String labelText;
  final TextEditingController controller;
  final DateTime initialDate;
  @override
  State<StartEndTimeTextField> createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<StartEndTimeTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();

    context.read<TextFieldBloc>().add(
        TextFieldControllerAddedEvent(widget.controller, widget.labelText));
    widget.controller.text = convertDate(widget.initialDate);
    context.read<TextFieldBloc>().add(TextFieldControllerTextChangedEvent(
        widget.controller, convertDate(widget.initialDate), widget.labelText));

    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
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
      labelStyle: Theme.of(context).textTheme.labelMedium,
      focusNode: _focusNode,
      hasFocus: _hasFocus,
      readOnly: true,
      suffixIcon: IconButtonWidget(
          iconData: Icons.arrow_drop_down,
          color: Colors.grey,
          onPressed: () {
            showDropdown(context);
          }),
    );
  }

  void showDropdown(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      _showDialog(
        CupertinoDatePicker(
          initialDateTime: widget.initialDate,
          mode: CupertinoDatePickerMode.time,
          minimumDate: DateTime.now(),
          use24hFormat: true,
          onDateTimeChanged: (DateTime newTime) {
            _updateTextFieldAndBloc(newTime);
          },
        ),
      );
    } else {
      showMaterialTimePicker(context);
    }
  }

  void showMaterialTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(widget.initialDate),
    );

    if (pickedTime != null) {
      final newTime = DateTime(
        widget.initialDate.year,
        widget.initialDate.month,
        widget.initialDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      _updateTextFieldAndBloc(newTime);
    }
  }

  void _updateTextFieldAndBloc(DateTime newTime) {
    widget.controller.text = convertDate(newTime);
    context.read<TextFieldBloc>().add(
          TextFieldControllerTextChangedEvent(
            widget.controller,
            convertDate(newTime),
            widget.labelText,
          ),
        );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: AppColors.white,
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  String convertDate(DateTime? date) {
    return DateFormat('HH:mm').format(date ?? DateTime.now());
  }
}
