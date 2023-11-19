import 'package:flutter/material.dart';

import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';

import 'package:notes_app/ui/widgets/widgets_index.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String _dropDownValue = 'All';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(20),
      dropdownColor: AppColors.green,
      hint: _HintWidget(dropDownValue: _dropDownValue),
      iconSize: 0.0,
      items: AppData()
          .filterList
          .map((val) => DropdownMenuItem<String>(
                value: val,
                child: Text(val, style: Theme.of(context).textTheme.bodySmall),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  void onChanged(String? value) {
    context
        .read<NotesBloc>()
        .add(ShowCategoryNotesEvent(category: value ?? _dropDownValue));
    setState(() {
      _dropDownValue = value ?? _dropDownValue;
    });
  }
}

class _HintWidget extends StatelessWidget {
  const _HintWidget({
    Key? key,
    required this.dropDownValue,
  }) : super(key: key);

  final String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 100,
      color: AppColors.green,
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                dropDownValue,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: AppColors.white),
        ],
      ),
    );
  }
}
