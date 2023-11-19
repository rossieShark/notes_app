import 'package:flutter/material.dart';

import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/models/models_index.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/screens/screens_index.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
      return state.map(
          loading: (_) => const Center(child: CustomFadingCircleIndicator()),
          noResults: (_) => const NoResultsWidget(),
          loaded: (loadEvent) => _NotesListLoaded(notes: loadEvent.data));
    });
  }
}

class _NotesListLoaded extends StatelessWidget {
  final List<NotesModel> notes;
  const _NotesListLoaded({
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    final filteredNotes = _createFilteredList(context);
    return filteredNotes.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(0),
            itemCount: filteredNotes.length,
            itemBuilder: (context, index) {
              final note = filteredNotes[index];
              return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: AppColors.green,
                  ),
                  key: UniqueKey(),
                  onDismissed: (DismissDirection direction) {
                    context.read<NotesBloc>().add(RemoveNotesEvent(note));
                  },
                  child: _NotesListViewContent(note: note));
            })
        : const NoResultsWidget();
  }

  List<NotesModel> _createFilteredList(BuildContext context) {
    final date = context.watch<CurrentDateBloc>().state.selectedDate;
    return notes
        .where((note) =>
            DateTimeService().convertToEDDMM(note.date).day == (date!.day))
        .toList();
  }
}

class _NotesListViewContent extends StatelessWidget {
  final NotesModel note;
  const _NotesListViewContent({
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _editNoteTap(context, note),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: note.isOver
              ? AppColors.pink.withOpacity(0.3)
              : AppColors.white.withOpacity(0.8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _NoteDataWidget(note: note),
            _CheckBoxButton(note: note),
          ],
        ),
      ),
    );
  }

  void _editNoteTap(BuildContext context, NotesModel note) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ShowEditWidget(
        note: note,
      ),
    );
  }
}

class _NoteDataWidget extends StatelessWidget {
  const _NoteDataWidget({
    required this.note,
  });

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Image.asset(
          note.category.image,
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TitleWidget(note: note),
            const SizedBox(
              height: 10,
            ),
            _TimeIntervalWidget(note: note)
          ],
        ),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.note,
  });

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Text(
      note.title,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.redBrown),
    );
  }
}

class _TimeIntervalWidget extends StatelessWidget {
  const _TimeIntervalWidget({
    required this.note,
  });

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${note.date}, ${note.startTime} - ${note.endTime}",
      style: const TextStyle(
          fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.green),
    );
  }
}

class _CheckBoxButton extends StatelessWidget {
  const _CheckBoxButton({
    required this.note,
  });

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => isNoteComplete(context),
        icon: Icon(
            color: AppColors.darkRedBrown,
            note.isComplete
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank));
  }

  void isNoteComplete(BuildContext context) {
    context.read<NotesBloc>().add(IsNoteCompletedEvent(note));
  }
}
