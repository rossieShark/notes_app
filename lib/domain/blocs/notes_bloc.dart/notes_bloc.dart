import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/models/notes_model.dart';

import 'package:notes_app/services/services_index.dart';

class NotesBloc extends Bloc<NotesBlocEvent, NotesState> {
  final NoteService _firestoreService;
  final DateTimeService _dateService;
  late Timer _timer;
  NotesBloc(this._firestoreService, this._dateService)
      : super(const NotesState.loading()) {
    on<AddNotesEvent>(onAddNotesEvent);
    on<RemoveNotesEvent>(onDeleteNotesEvent);
    on<UpdateNotesEvent>(onUpdateNotesEvent);
    on<ShowCategoryNotesEvent>(onShowCategoryEvent);
    on<IsNoteCompletedEvent>(onUpdateNotesIsCompleteEvent);
    on<FetchAndShowNotesEvent>(onFetchAndShowNotesEvent);
    on<IsTimeOverEvent>(onIsTimeOvverIvent);
    on<FilterNotesByDateEvent>(onFilterNotesByDate);

    _timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      add(const IsTimeOverEvent());
    });
  }

  void onAddNotesEvent(AddNotesEvent event, Emitter<NotesState> emit) async {
    final user = FirebaseAuth.instance.currentUser;
    final userToken = await user?.getIdToken() ?? '';

    await _firestoreService.addNote(event.note, userToken);
    add(const FetchAndShowNotesEvent());
  }

  void onDeleteNotesEvent(
      RemoveNotesEvent event, Emitter<NotesState> emit) async {
    await _firestoreService.removeNote(event.note);
    add(const FetchAndShowNotesEvent());
  }

  void onUpdateNotesEvent(
      UpdateNotesEvent event, Emitter<NotesState> emit) async {
    await _firestoreService.updateNote(event.newNote);
    add(const FetchAndShowNotesEvent());
  }

  void onShowCategoryEvent(
      ShowCategoryNotesEvent event, Emitter<NotesState> emit) async {
    final categoryToShow = event.category;
    if (categoryToShow == 'All') {
      await for (final notesList in _firestoreService.getNotes()) {
        final note = notesList;
        emit(NotesState.loaded(data: note));
      }
    } else {
      await for (final notesList in _firestoreService.getNotes()) {
        final filteredList = notesList
            .where((note) => note.category.category == categoryToShow)
            .toList();
        emit(NotesState.loaded(data: filteredList));
      }
    }
  }

  void onUpdateNotesIsCompleteEvent(
      IsNoteCompletedEvent event, Emitter<NotesState> emit) async {
    final updatedNote = event.oldNote.copyWith(
      isComplete: !event.oldNote.isComplete,
    );
    await _firestoreService.updateNote(updatedNote);
    add(const FetchAndShowNotesEvent());
    await Future.delayed(const Duration(seconds: 1), () async {
      add(RemoveNotesEvent(updatedNote));
    });
  }

  void onFetchAndShowNotesEvent(
      FetchAndShowNotesEvent event, Emitter<NotesState> emit) async {
    try {
      final notes = await _fetchNotes();
      if (emit.isDone) {
        return;
      }
      if (notes.isEmpty) {
        emit(const NotesState.noResults());
      } else {
        emit(NotesState.loaded(data: notes));
      }
    } catch (error) {
      print("Error fetching and filtering notes: $error");
    }
  }

  void onIsTimeOvverIvent(
      IsTimeOverEvent event, Emitter<NotesState> emit) async {
    final notes = await _fetchNotes();

    final filteredNotes = notes
        .where((note) =>
            _dateService.convertToEDDMM(note.date).day == DateTime.now().day)
        .toList();

    for (var note in filteredNotes) {
      final time = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        _dateService.convertToHHMM(note.endTime).hour,
        _dateService.convertToHHMM(note.endTime).minute,
      );

      final currentTime = DateTime.now();

      if (note.isOver) {
        continue;
      } else if (currentTime.isAfter(time)) {
        final updatedNote = note.copyWith(isOver: true);
        await _firestoreService.updateNote(updatedNote);
      }
    }
    add(const FetchAndShowNotesEvent());
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

  void onFilterNotesByDate(
      FilterNotesByDateEvent event, Emitter<NotesState> emit) async {
    final notes = await _fetchNotes();

    final filteredNotes = notes
        .where((note) =>
            _dateService.convertToEDDMM(note.date).day == DateTime.now().day)
        .toList();

    emit(NotesState.loaded(data: filteredNotes));
  }

  Future<List<NotesModel>> _fetchNotes() async {
    return await _firestoreService.getNotes().first;
  }
}
