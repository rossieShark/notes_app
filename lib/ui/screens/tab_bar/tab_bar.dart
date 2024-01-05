import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/blocs/bloc_index.dart';
import 'package:notes_app/ui/navigation/auto_router.dart';

@RoutePage()
class ButtomTabBarPage extends StatefulWidget {
  const ButtomTabBarPage({
    super.key,
  });

  @override
  State<ButtomTabBarPage> createState() => _ButtomTabBarPageState();
}

class _ButtomTabBarPageState extends State<ButtomTabBarPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarBloc, int>(builder: (context, tabIndex) {
      return AutoTabsRouter(
          routes: const [NotesScreenRoute(), ProfileScreenRoute()],
          transitionBuilder: (context, child, animation) => FadeTransition(
                opacity: animation,
                // the passed child is technically our animated selected-tab page
                child: child,
              ),
          builder: (context, child) {
            // obtain the scoped TabsRouter controller using context
            final tabsRouter = AutoTabsRouter.of(context);
            // Here we're building our Scaffold inside of AutoTabsRouter
            // to access the tabsRouter controller provided in this context
            //
            //alterntivly you could use a global key
            return Scaffold(
              body: child,
              bottomNavigationBar: Container(
                margin: EdgeInsets.zero,
                child: BottomNavigationBar(
                    currentIndex: tabIndex,
                    onTap: (index) {
                      tabsRouter.setActiveIndex(index);
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
    });
  }
}
