import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/model/todo_model.dart';
import '../../view_model/cubit/todo_cubit.dart';
import '../../view_model/helper.dart';
import '../../view_model/routes/route_paths.dart';
import '../widgets/task_tile_widget.dart';
import 'task_view.dart';

class TaskDashboard extends StatefulWidget {
  const TaskDashboard({Key? key}) : super(key: key);

  @override
  State<TaskDashboard> createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskDashboard> {
  final Helper helper = Helper();
  final List<String> sortOptions = [
    'Sort By Priority',
    'Sort By Due Date',
    'Sort By Creation Date',
  ];

  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.search_tasks);
            },
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
              onSelected: (value) {
                if (value == sortOptions[0]) {
                  // open edit page to edit the text
                  // context.read<TodoCubit>().sortByPriority();
                } else if (value == sortOptions[1]) {
                  // delete the tile and refresh the page
                  // context.read<TodoCubit>().sortByDueDate();
                } else if (value == sortOptions[2]) {
                  // context.read<TodoCubit>().sortByCreationDate();
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: sortOptions[0],
                    child: Text(sortOptions[0]),
                  ),
                  PopupMenuItem(
                    value: sortOptions[1],
                    child: Text(sortOptions[1]),
                  ),
                  PopupMenuItem(
                    value: sortOptions[2],
                    child: Text(sortOptions[2]),
                  )
                ];
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: StreamBuilder<List<ToDoModel>>(
        stream: context.read<TodoCubit>().stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<ToDoModel>? todoList = snapshot.data as List<ToDoModel>?;
            return ListView.builder(
              itemCount: todoList!.length,
              itemBuilder: (context, index) {
                final ToDoModel todo = todoList[index];
                print('ID: ${todo.id}');
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskView(
                          title: todo.title,
                          description: todo.description,
                        ),
                      ),
                    );
                  },
                  child: TaskTileWidget(
                    dueDate: todo.setDueDate!,
                    dueTime: todo.setDueTime!,
                    setPriority: todo.setPriority!,
                    titleMessage: todo.title!,
                    deleteItemId: todo.id,
                    editItemId: todo.id,
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text('Error! Try again!');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.create_view_edit_tasks);
        },
        elevation: 0.0,
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
