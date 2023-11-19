import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/services/services_index.dart';

class SetGetItDependencies {
  void setUpServices() {
    GetIt.I.registerLazySingleton<NoteService>(NoteService.new);
    GetIt.I.registerLazySingleton<DateTimeService>(DateTimeService.new);
    GetIt.I.registerLazySingleton<ImagePickerService>(ImagePickerService.new);
  }

  void setUpBlocs() {
    GetIt.instance
        .registerFactory<NotesBloc>(() => NotesBloc(GetIt.I(), GetIt.I()));

    GetIt.instance.registerFactory<ImageBloc>(() => ImageBloc(GetIt.I()));
    GetIt.instance.registerLazySingleton<CategoriesBloc>(
      () => CategoriesBloc(),
    );
    GetIt.instance.registerLazySingleton<CurrentDateBloc>(
      () => CurrentDateBloc(),
    );
    GetIt.instance.registerLazySingleton<TabBarBloc>(
      () => TabBarBloc(),
    );
    GetIt.instance.registerLazySingleton<TextFieldBloc>(
      () => TextFieldBloc(),
    );
  }
}
