import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/models/models_index.dart';
import 'package:notes_app/services/date_time_service.dart';

class ImagesGridView extends StatelessWidget {
  final DateTime? currentDate;
  const ImagesGridView({super.key, required this.currentDate});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
      return state.map(
        loading: (_) => Container(),
        noResults: (_) => Container(),
        loaded: (LoadedNotesState value) {
          final filteredNotes = createFilteredList(value.data, currentDate);
          return _CategoriesGridView(notes: filteredNotes);
        },
      );
    });
  }

  List<NotesModel> createFilteredList(List<NotesModel> notes, DateTime? date) {
    return notes
        .where((note) =>
            DateTimeService().convertToEDDMM(note.date).day == date?.day)
        .toList();
  }
}

class _CategoriesGridView extends StatelessWidget {
  final List<NotesModel> notes;

  const _CategoriesGridView({required this.notes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
        ),
        itemCount: min(notes.length, 6),
        itemBuilder: (context, index) {
          return Image.asset(
            notes[index].category.image,
          );
        },
      ),
    );
  }
}
