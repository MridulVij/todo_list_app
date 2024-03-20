import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/model/utils/date_time_picker.dart';
import 'package:todo_list_app/model/utils/priority_picker.dart';
import 'package:todo_list_app/view/widgets/custom_button_container.dart';
import 'package:todo_list_app/view_model/helper.dart';
import 'package:todo_list_app/view_model/todo_cubit/todo_cubit.dart';

class TaskCreateEdit extends StatefulWidget {
  // final String? taskTitle;
  const TaskCreateEdit({
    super.key,
    //  required this.taskTitle
  });

  @override
  State<TaskCreateEdit> createState() => _TaskCreateEditState();
}

class _TaskCreateEditState extends State<TaskCreateEdit> {
  CustomButtonContainer customButtonContainer = CustomButtonContainer();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> priorityOptions = ['Low', 'Medium', 'High'];
  // CustomButtonContainer customButtonContainer = CustomButtonContainer();
  DateTimePicker dateTimePicker = DateTimePicker();
  PriorityPicker priorityPicker = PriorityPicker();
  Helper helper = Helper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.taskTitle!),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<TodoCubit>(context).addToDo(
                titleController.text,
                descriptionController.text,
                dateTimePicker.getDateTime,
                DateTime.now(),
                1,
              );
              Navigator.pop(context);
            },
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
                    ), () async {
                  // Date & Time Picker
                  await dateTimePicker.selectDateTime(context);
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
                  // Set Priority
                  helper.showPrioritySetBox(context);
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
