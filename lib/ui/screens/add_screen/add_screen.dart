import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/models/models_index.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        shadowColor: Colors.transparent,
        leading: const _BackButton(),
        actions: const [_SaveButton()],
      ),
      body: Stack(children: [
        Container(width: width, height: height, color: AppColors.puce),
        ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)),
          child: Container(height: height / 2 - 190, color: AppColors.yellow),
        ),
        const _AddScreenContent()
      ]),
    );
  }
}

class _AddScreenContent extends StatefulWidget {
  const _AddScreenContent();

  @override
  State<_AddScreenContent> createState() => _AddScreenContentState();
}

class _AddScreenContentState extends State<_AddScreenContent> {
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  void initState() {
    _titleController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text('Create new task',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 20,
          ),
          TitleTextField(
            controller: _titleController,
            labelText: AppData().titleTextField,
          ),
          const SizedBox(
            height: 10,
          ),
          DateTextField(
            controller: _dateController,
          ),
          const SizedBox(
            height: 70,
          ),
          _StartEndTimeTextField(
              startTimeController: _startTimeController,
              endTimeController: _endTimeController),
          Container(
              height: 190,
              color: Colors.transparent,
              child: SingleChildScrollView(
                  child: DescriptionTextField(
                controller: _descriptionController,
              ))),
          const SizedBox(
            height: 40,
          ),
          const Categories(),
        ],
      ),
    );
  }
}

class _StartEndTimeTextField extends StatelessWidget {
  const _StartEndTimeTextField({
    required TextEditingController startTimeController,
    required TextEditingController endTimeController,
  })  : _startTimeController = startTimeController,
        _endTimeController = endTimeController;

  final TextEditingController _startTimeController;
  final TextEditingController _endTimeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldContainer(
          controller: _startTimeController,
          label: AppData().startTimeTextField,
        ),
        TextFieldContainer(
          controller: _endTimeController,
          initialDate: DateTime.now().add(const Duration(hours: 1)),
          label: AppData().endTimeTextField,
        )
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {
        context.pop();
      },
      iconData: Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
      color: AppColors.green,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldBloc, TextFieldState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () => _onPressed(context, state),
          child: const Text(
            'Save',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        );
      },
    );
  }

  void _onPressed(BuildContext context, TextFieldState state) {
    final bloc = context.read<NotesBloc>();
    final textFieldsBloc = context.read<TextFieldBloc>();
    final category = context.read<CategoriesBloc>().state.category;
    const uuid = Uuid();
    final uniqueId = uuid.v4();

    textFieldsBloc.add(TextFieldControllerIsValidEvent());

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // Wait for the event to be processed
    if (state.isValid) {
      bloc.add(AddNotesEvent(
        NotesModel(
          index: uniqueId,
          category: category,
          title: state.controllers[AppData().titleTextField]?.controller.text ??
              "Note",
          date: state.controllers[AppData().dateTextField]?.controller.text ??
              "Note",
          startTime: state
                  .controllers[AppData().startTimeTextField]?.controller.text ??
              "Note",
          endTime:
              state.controllers[AppData().endTimeTextField]?.controller.text ??
                  "Note",
          description: state.controllers[AppData().descriptionTextField]
                  ?.controller.text ??
              "Note",
          isComplete: false,
          isOver: false,
        ),
      ));
      textFieldsBloc.add(RemoveAllEvent());
      Navigator.pop(context);
    }
    // });
  }
}
