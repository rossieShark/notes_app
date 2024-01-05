import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/domain/interface/app_builder.dart';
import 'package:notes_app/ui/screens/main_app/my_app.dart';

class MainAppBuilder implements AppBuilder {
  @override
  Widget buildApp() {
    return MultiBlocProvider(providers: [
      BlocProvider<TabBarBloc>(create: (context) => TabBarBloc()),
      BlocProvider<NotesBloc>(
        create: (context) => GetIt.I()..add(const FetchAndShowNotesEvent()),
      ),
      BlocProvider<CurrentDateBloc>(
        create: (context) => GetIt.I(),
      ),
      BlocProvider<CategoriesBloc>(
        create: (context) => GetIt.I(),
      ),
      BlocProvider<TextFieldBloc>(
        create: (context) => GetIt.I(),
      ),
      BlocProvider<ImageBloc>(
        create: (context) => GetIt.I(),
      ),
    ], child: const MyApp());
  }
}
