import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/domain/models/models_index.dart';

part 'notes_state.freezed.dart';

@Freezed()
class NotesState with _$NotesState {
  const factory NotesState.loading() = LoadingNotesState;
  const factory NotesState.noResults() = NoResultsNotesState;
  const factory NotesState.loaded({required List<NotesModel> data}) =
      LoadedNotesState;
}
