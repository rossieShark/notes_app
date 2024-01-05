import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/screens/screens_index.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();
// final router = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   initialLocation: routeNameMap[RouteName.home]!,
//   routes: [
//     ShellRoute(
//         navigatorKey: _shellNavigatorKey,
//         builder: (context, state, widget) => ButtomTabBarPage(
//               key: state.pageKey,
//               child: widget,
//             ),
//         routes: [
//           GoRoute(
//             path: routeNameMap[RouteName.home]!,
//             pageBuilder: (context, state) => const CupertinoPage(
//               child: NotesScreenPage(),
//             ),
//             redirect: (BuildContext context, GoRouterState state) {
//               final FirebaseAuth auth = FirebaseAuth.instance;
//               if (auth.currentUser == null) {
//                 return routeNameMap[RouteName.start]!;
//               } else {
//                 return null;
//               }
//             },
//           ),
//           GoRoute(
//             path: routeNameMap[RouteName.profile]!,
//             pageBuilder: (context, state) => const CupertinoPage(
//               child: ProfileScreenPage(),
//             ),
//           ),
//         ]),
//     GoRoute(
//         path: routeNameMap[RouteName.start]!,
//         pageBuilder: (context, state) => const CupertinoPage(
//               child: StartPage(),
//             )),
//     GoRoute(
//       path: routeNameMap[RouteName.sigIn]!,
//       pageBuilder: (context, state) => const CupertinoPage(
//         child: SignInPage(),
//       ),
//     ),
//     GoRoute(
//       path: routeNameMap[RouteName.signUp]!,
//       pageBuilder: (context, state) => const CupertinoPage(
//         child: SignUpPage(),
//       ),
//     ),
//     GoRoute(
//       parentNavigatorKey: _rootNavigatorKey,
//       path: routeNameMap[RouteName.addNote]!,
//       pageBuilder: (context, state) => const CupertinoPage(
//         child: AddScreenPage(),
//       ),
//     ),
//   ],
// );

// enum RouteName {
//   home,
//   addNote,
//   profile,
//   sigIn,
//   signUp,
//   start,
// }

// Map<RouteName, String> routeNameMap = {
//   RouteName.home: '/',
//   RouteName.addNote: '/add',
//   RouteName.profile: '/profile',
//   RouteName.sigIn: '/signin',
//   RouteName.signUp: '/signup',
//   RouteName.start: '/start',
// };
