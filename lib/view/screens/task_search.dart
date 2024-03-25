import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../view_model/helper.dart';
import '../widgets/custom_searchbox.dart';
import '../widgets/task_tile_widget.dart';
import 'task_view.dart';

class TaskSearch extends StatefulWidget {
  const TaskSearch({super.key});

  @override
  State<TaskSearch> createState() => _TaskSearchState();
}

class _TaskSearchState extends State<TaskSearch> {
  //

  TextEditingController searchController = TextEditingController();
  Helper helper = Helper();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: CustomSearchBox(
                controller: searchController,
              ),
            ),
            Expanded(
                child: ListView.builder(
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
                  child: TaskTileWidget(),
                );
              }),
            )),
          ],
        ),
      ),
    );
  }
}
