import 'package:notes_app/domain/blocs/bloc_index.dart';

class CurrentDateBloc extends Bloc<CurrentDateEvent, CurrentDateState> {
  CurrentDateBloc() : super(CurrentDateState(selectedDate: DateTime.now())) {
    on<CanheCurrentDateEvent>(_updateSelectedDate);
  }

  void _updateSelectedDate(
      CanheCurrentDateEvent event, Emitter<CurrentDateState> emit) async {
    final currentDate = DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - 1 - event.index));
    emit(CurrentDateState(selectedDate: currentDate));
  }
}
