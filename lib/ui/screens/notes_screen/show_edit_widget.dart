import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/models/models_index.dart';
import 'package:notes_app/services/services_index.dart';

import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class ShowEditWidget extends StatefulWidget {
  final NotesModel note;
  const ShowEditWidget({
    super.key,
    required this.note,
  });

  @override
  State<ShowEditWidget> createState() => _ShowEditWidgetState();
}

class _ShowEditWidgetState extends State<ShowEditWidget> {
  late TextEditingController _titleTextFieldController;
  late TextEditingController _descriptionTextFieldController;

  @override
  void initState() {
    _titleTextFieldController = TextEditingController(
      text: widget.note.title,
    );
    _descriptionTextFieldController = TextEditingController(
      text: widget.note.description,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColors.lightPink,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          height: 250.0,
          width: 220.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextField(controller: _titleTextFieldController),
                Expanded(
                  child: DescriptionTextField(
                      focusedBorderColor: Colors.transparent,
                      enabledBorderColor: Colors.transparent,
                      labelStyle: Theme.of(context).textTheme.labelLarge,
                      controller: _descriptionTextFieldController),
                ),
                _SaveButtonWidget(
                  widget: widget,
                  titleTextFieldController: _titleTextFieldController,
                  descriptionTextFieldController:
                      _descriptionTextFieldController,
                ),
              ],
            ),
          ),
        ));
  }
}

class _SaveButtonWidget extends StatelessWidget {
  const _SaveButtonWidget({
    required TextEditingController titleTextFieldController,
    required TextEditingController descriptionTextFieldController,
    required this.widget,
  })  : _titleTextFieldController = titleTextFieldController,
        _descriptionTextFieldController = descriptionTextFieldController;

  final TextEditingController _titleTextFieldController;
  final TextEditingController _descriptionTextFieldController;
  final ShowEditWidget widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldBloc, TextFieldState>(
        builder: (context, state) {
      return Align(
        alignment: Alignment.bottomRight,
        child: CustomButton(
          onPressed: () => _onPressed(context, state),
          buttonText: 'Save',
          width: 100,
        ),
      );
    });
  }

  void _onPressed(BuildContext context, TextFieldState state) {
    final textFieldsBloc = context.read<TextFieldBloc>();
    textFieldsBloc.add(TextFieldControllerIsValidEvent(true));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.isValid) {
        BlocProvider.of<NotesBloc>(context).add(
          UpdateNotesEvent(
            widget.note,
            NotesModel(
                index: widget.note.index,
                title: _titleTextFieldController.text,
                date: widget.note.date,
                startTime: widget.note.startTime,
                endTime: widget.note.endTime,
                description: _descriptionTextFieldController.text,
                category: widget.note.category,
                isComplete: widget.note.isComplete,
                isOver: widget.note.isOver),
          ),
        );
        context.canPop() ? context.pop() : {};
        textFieldsBloc.add(RemoveAllEvent());
      }
    });
  }
}
