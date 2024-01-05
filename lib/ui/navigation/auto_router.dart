import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/ui/screens/add_screen/add_screen.dart';
import 'package:notes_app/ui/screens/home_page.dart';
import 'package:notes_app/ui/screens/log_pages/sign_in/sign_in_page.dart';
import 'package:notes_app/ui/screens/log_pages/sign_up/sign_up_screen.dart';
import 'package:notes_app/ui/screens/log_pages/start_page/start_page.dart';
import 'package:notes_app/ui/screens/notes_screen/notes_screen.dart';
import 'package:notes_app/ui/screens/profile_screen/profile_screen.dart';
import 'package:notes_app/ui/screens/tab_bar/tab_bar.dart';

part 'auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: ButtomTabBarRoute.page, guards: [
      AuthGuard()
    ], children: [
      AutoRoute(path: '', page: NotesScreenRoute.page),
      AutoRoute(path: 'profile', page: ProfileScreenRoute.page),
    ]),
    AutoRoute(path: '/addNote', page: AddScreenRoute.page),
    AutoRoute(path: '/login', page: StartRoute.page),
    AutoRoute(
      path: '/sign_in',
      page: SignInRoute.page,
    ),
    AutoRoute(
      path: '/sign_up',
      page: SignUpRoute.page,
    ),
  ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      router.push(const StartRoute());
    } else {
      resolver.next(true);
    }
  }
}
