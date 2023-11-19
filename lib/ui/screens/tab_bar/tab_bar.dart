import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';

import 'package:notes_app/ui/navigation/navigation_utils.dart';

class ButtomTabBarPage extends StatefulWidget {
  final Widget child;
  const ButtomTabBarPage({
    required this.child,
    super.key,
  });

  @override
  State<ButtomTabBarPage> createState() => _ButtomTabBarPageState();
}

class _ButtomTabBarPageState extends State<ButtomTabBarPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarBloc, int>(builder: (context, tabIndex) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: widget.child,
        bottomNavigationBar: Container(
          margin: EdgeInsets.zero,
          child: BottomNavigationBar(
              currentIndex: tabIndex,
              onTap: (index) {
                NavigationUtils.tabBarRoutes(context, index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.note_alt,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person_fill,
                    ),
                    label: ''),
              ]),
        ),
      );
    });
  }
}
