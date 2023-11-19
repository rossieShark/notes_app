import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/models/models_index.dart';

class CategoriesBloc extends Bloc<CategoriesBlocEvent, CategoriesBlocState> {
  CategoriesBloc()
      : super(CategoriesBlocState(
            category: CategoriesModel(category: '', image: ''))) {
    on<SaveBlocEvent>(_updateCategory);
  }

  void _updateCategory(
      SaveBlocEvent event, Emitter<CategoriesBlocState> emit) async {
    emit(CategoriesBlocState(category: event.category));
  }
}
