import 'package:equatable/equatable.dart';
import 'package:notes_app/domain/models/models_index.dart';

abstract class NotesBlocEvent extends Equatable {
  const NotesBlocEvent();
}

class FetchAndShowNotesEvent extends NotesBlocEvent {
  const FetchAndShowNotesEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddNotesEvent extends NotesBlocEvent {
  final NotesModel note;
  const AddNotesEvent(this.note);

  @override
  List<Object> get props => [note];
}

class RemoveNotesEvent extends NotesBlocEvent {
  final NotesModel note;
  const RemoveNotesEvent(this.note);

  @override
  List<Object> get props => [note];
}

class UpdateNotesEvent extends NotesBlocEvent {
  final NotesModel oldNote;
  final NotesModel newNote;
  const UpdateNotesEvent(this.oldNote, this.newNote);

  @override
  List<Object> get props => [newNote];
}

class IsNoteCompletedEvent extends NotesBlocEvent {
  final NotesModel oldNote;
  const IsNoteCompletedEvent(this.oldNote);

  @override
  List<Object?> get props => [oldNote];
}

class ShowCategoryNotesEvent extends NotesBlocEvent {
  final String category;
  const ShowCategoryNotesEvent({required this.category});

  @override
  List<Object> get props => [category];
}

class IsTimeOverEvent extends NotesBlocEvent {
  const IsTimeOverEvent();

  @override
  List<Object> get props => [];
}

class SortDateNotesEvent extends NotesBlocEvent {
  final String date;
  const SortDateNotesEvent({required this.date});

  @override
  List<Object?> get props => [date];
}

class ClearCompletedNotesEvent extends NotesBlocEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ToggleAllNotesEvent extends NotesBlocEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FilterNotesByDateEvent extends NotesBlocEvent {
  final DateTime currentDate;
  const FilterNotesByDateEvent(this.currentDate);

  @override
  List<Object?> get props => [currentDate];
}
