import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list_app/view/widgets/custom_button_container.dart';

class TaskCreateEditView extends StatefulWidget {
  // final String? taskTitle;
  const TaskCreateEditView({
    super.key,
    //  required this.taskTitle
  });

  @override
  State<TaskCreateEditView> createState() => _TaskCreateEditViewState();
}

class _TaskCreateEditViewState extends State<TaskCreateEditView> {
  CustomButtonContainer customButtonContainer = CustomButtonContainer();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> priorityOptions = ['Low', 'Medium', 'High'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.taskTitle!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: null,
                      style: const TextStyle(fontSize: 30),
                      controller: titleController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Title'),
                    ),
                    const Divider(),
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      // expands: true,
                      maxLines: null,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Description'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: customButtonContainer.customColorfulContainer(
                    2,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Set Reminder',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ), () {
                  print('tap');
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: customButtonContainer.customColorfulContainer(
                    1,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Set Priority',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ), () {
                  print('tap');
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
