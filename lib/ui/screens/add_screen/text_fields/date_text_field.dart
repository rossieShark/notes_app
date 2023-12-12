import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _initializeController();
    _setupListeners();
  }

  void _initializeController() {
    widget.controller.text = convertDate(selectedDate);
    context.read<TextFieldBloc>().add(
          TextFieldControllerAddedEvent(widget.controller, 'Date'),
        );
    context.read<TextFieldBloc>().add(
          TextFieldControllerTextChangedEvent(
            widget.controller,
            convertDate(selectedDate),
            AppData().dateTextField,
          ),
        );
  }

  void _setupListeners() {
    widget.controller.addListener(() {
      setState(() {});
    });

    _focusNode = FocusNode();
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
      labelText: 'Date',
      focusNode: _focusNode,
      readOnly: true,
      hasFocus: _hasFocus,
      suffixIcon: GestureDetector(
        onTap: () async => await _selectDate(context),
        child: const Icon(
          Icons.calendar_month,
          color: AppColors.green,
        ),
      ),
    );
  }

  String convertDate(DateTime? date) {
    return DateFormat('E, d MMMM').format(date ?? DateTime.now());
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      picked = await showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) => _buildCupertinoDatePicker(),
      );
    } else {
      picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        builder: (context, child) => _buildMaterialDatePicker(child),
      );
    }

    if (picked != null && picked != selectedDate) {
      _updateSelectedDate(picked);
      // ignore: use_build_context_synchronously
      context.read<TextFieldBloc>().add(
            TextFieldControllerTextChangedEvent(
              widget.controller,
              convertDate(picked),
              AppData().dateTextField,
            ),
          );
    }
  }

  Widget _buildCupertinoDatePicker() {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        minimumDate: DateTime.now(),
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (DateTime newDate) {
          _updateSelectedDate(newDate);
        },
      ),
    );
  }

  Widget _buildMaterialDatePicker(Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: AppColors.pink,
          onPrimary: AppColors.white,
          onSurface: AppColors.green,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20),
        ),
      ),
      child: child!,
    );
  }

  void _updateSelectedDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
      widget.controller.text = convertDate(newDate);
    });
  }
}
