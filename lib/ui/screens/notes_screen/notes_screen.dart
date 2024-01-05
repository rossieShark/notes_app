import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/navigation/auto_router.dart';
import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

@RoutePage()
class NotesScreenPage extends StatefulWidget {
  const NotesScreenPage({super.key});

  @override
  State<NotesScreenPage> createState() => _NotesScreenPageState();
}

class _NotesScreenPageState extends State<NotesScreenPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.yellow,
      body: Column(
        children: [
          WeekDay(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _AddButton(),
                FilterWidget(),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: NotesList()),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();
  final _buttonText = 'Add Note';
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 100,
      color: AppColors.green,
      onPressed: () {
        context.router.push(const AddScreenRoute());
      },
      buttonText: _buttonText,
    );
  }
}
