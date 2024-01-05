import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/interface/app_builder.dart';
import 'package:notes_app/domain/interface/app_runner.dart';
import 'package:notes_app/firebase_options.dart';
import 'package:notes_app/services/services_index.dart';

class MainAppRunner implements AppRunner {
  final String env;
  const MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SetGetItDependencies().setUpServices();
    SetGetItDependencies().setUpBlocs();

    await initializeDateFormatting('en');
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
}
