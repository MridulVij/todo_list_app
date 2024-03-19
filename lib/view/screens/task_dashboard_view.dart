import 'package:flutter/material.dart';
import 'package:todo_list_app/view/widgets/task_tile_widget.dart';

class TaskDashboard extends StatefulWidget {
  const TaskDashboard({super.key});

  @override
  State<TaskDashboard> createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskDashboard> {
  TaskTileWidget taskTileWidget = TaskTileWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: taskTileWidget.taskTile(1, 'Task Title', '20 March - 6 PM'),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        elevation: 0.0,
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
