import 'package:notes_app/domain/models/models_index.dart';

abstract class CategoriesBlocEvent {}

class SaveBlocEvent extends CategoriesBlocEvent {
  CategoriesModel category;

  SaveBlocEvent(this.category);
}
