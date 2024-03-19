import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list_app/view/widgets/custom_button_container.dart';

class TaskReadEditView extends StatefulWidget {
  // final String? taskTitle;
  const TaskReadEditView({
    super.key,
    //  required this.taskTitle
  });

  @override
  State<TaskReadEditView> createState() => _TaskReadEditViewState();
}

class _TaskReadEditViewState extends State<TaskReadEditView> {
  CustomButtonContainer customButtonContainer = CustomButtonContainer();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.taskTitle!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Title'),
                  ),
                  TextFormField(
                    expands: true,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Description'),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              customButtonContainer.customColorfulContainer(1, Text('Child'),
                  () {
                print('tap');
              }),
            ],
          )
        ],
      ),
    );
  }
}
