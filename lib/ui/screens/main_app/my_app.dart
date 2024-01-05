import 'package:flutter/material.dart';
import 'package:notes_app/ui/navigation/auto_router.dart';
import 'package:notes_app/ui/widgets/app_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: ThemeData(
        bottomNavigationBarTheme:
            AppThemeData().createBottomNavigationBarTheme(),
        textTheme: AppThemeData().createTextTheme(),
      ),
    );
  }
}
