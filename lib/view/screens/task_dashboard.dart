import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/model/model/todo_model.dart';
import 'package:todo_list_app/view/screens/task_view.dart';
import 'package:todo_list_app/view/widgets/task_tile_widget.dart';
import '../../view_model/helper.dart';
import '../../view_model/routes/route_paths.dart';
import '../../view_model/todo_cubit/todo_cubit.dart';

class TaskDashboard extends StatefulWidget {
  const TaskDashboard({super.key});

  @override
  State<TaskDashboard> createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskDashboard> {
  Helper helper = Helper();
  List<String> sortOptions = [
    'Sort By Priority',
    'Sort By Due Date',
    'Sort By Creation Date',
  ];
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
                  context.read<TodoCubit>().sortByPriority();
                } else if (value == sortOptions[1]) {
                  // delete the tile and refresh the page
                  context.read<TodoCubit>().sortByDueDate();
                } else if (value == sortOptions[2]) {
                  context.read<TodoCubit>().sortByCreationDate();
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
      body: BlocBuilder<TodoCubit, List<ToDoModel>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskView(
                          title: todos[index].title,
                          description: todos[index].description),
                    ),
                  );
                },
                child: TaskTileWidget(
                  titleMessage: todos[index].title,
                  dueDate: helper.formatDateTime(todos[index].setDueDateTime),
                  setPriority: todos[index].setPriority,
                  deleteItemId: index,
                  editItemId: index,
                ),
              );
            }),
          );
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
