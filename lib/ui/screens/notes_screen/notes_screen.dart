import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/navigation/go_router.dart';
import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
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
        context.push(routeNameMap[RouteName.addNote]!);
      },
      buttonText: _buttonText,
    );
  }
}
