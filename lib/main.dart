import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/firebase_options.dart';
import 'package:notes_app/services/services_index.dart';
import 'package:notes_app/ui/navigation/go_router.dart';
import 'package:notes_app/ui/widgets/widgets_index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SetGetItDependencies().setUpServices();
  SetGetItDependencies().setUpBlocs();

  await initializeDateFormatting('en');
  runApp(MultiBlocProvider(providers: [
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
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        bottomNavigationBarTheme:
            AppThemeData().createBottomNavigationBarTheme(),
        textTheme: AppThemeData().createTextTheme(),
      ),
    );
  }
}
