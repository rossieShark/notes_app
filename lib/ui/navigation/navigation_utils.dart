import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';

import 'package:notes_app/ui/navigation/go_router.dart';

class NavigationUtils {
  static void tabBarRoutes(BuildContext context, int index) {
    final tabBarBloc = context.read<TabBarBloc>();
    tabBarBloc.setTabIndex(index);

    switch (index) {
      case 0:
        context.go(routeNameMap[RouteName.home]!);
        break;
      case 1:
        context.go(routeNameMap[RouteName.profile]!);
        break;
    }
  }
}
