import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/view_model/routes/route_paths.dart';
import '../../view_model/todo_cubit/todo_cubit.dart';

class TaskTileWidget extends StatelessWidget {
  final int setPriority;
  final String titleMessage;
  final String dueDate;
  final int? deleteItemId;
  final int? editItemId;

  const TaskTileWidget({
    Key? key,
    this.deleteItemId,
    this.editItemId,
    required this.setPriority,
    required this.titleMessage,
    required this.dueDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (setPriority == 1)
            ? const Color.fromARGB(20, 76, 175, 79)
            : (setPriority == 2)
                ? const Color.fromARGB(20, 255, 153, 0)
                : const Color.fromARGB(20, 244, 67, 54),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 6,
                decoration: BoxDecoration(
                  color: (setPriority == 1)
                      ? Colors.green
                      : (setPriority == 2)
                          ? Colors.orange
                          : Colors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      titleMessage,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      dueDate,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == "edit") {
                Navigator.pushNamed(
                  context,
                  RoutesName.create_view_edit_tasks,
                  arguments: editItemId,
                );
              } else if (value == "delete") {
                BlocProvider.of<TodoCubit>(context).deleteToDo(deleteItemId!);
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: const [
                      Icon(Icons.edit),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
