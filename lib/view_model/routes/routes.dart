import 'package:flutter/material.dart';
import 'package:todo_list_app/view/screens/task_create.dart';
import 'package:todo_list_app/view/screens/task_dashboard.dart';

import '../../view/screens/task_search.dart';
import '../../view/screens/task_view.dart';
import 'route_paths.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeInToLinear;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case RoutesName.tasks_dashboard:
            return const TaskDashboard();
          case RoutesName.search_tasks:
            return const TaskSearch();
          case RoutesName.create_view_edit_tasks:
            String vari = settings.arguments.toString();
            print(vari);
            return TaskCreate(
              id: vari,
            );
          case RoutesName.tasks_view:
            Object? str = settings.arguments;
            return TaskView(map: str);
          default:
            return const Scaffold(
              body: Center(
                child: Text("No Routes Found"),
              ),
            );
        }
      },
    );
  }
}
