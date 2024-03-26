import 'package:bloc/bloc.dart';
import 'package:todo_list_app/model/model/todo_model.dart';
import 'package:todo_list_app/model/repository/sql_database.dart';

class TodoCubit extends Cubit<List<ToDoModel>> {
  final SQLDatabase sqlDatabase = SQLDatabase();

  TodoCubit() : super([]);

  void requestPermission() {
    sqlDatabase.initializeDatabase();
  }

  void getData() async {
    final todoData = await sqlDatabase.readData();
    emit(todoData);
  }

  void insertData(ToDoModel toDoModel) async {
    await sqlDatabase.insertData(toDoModel);
    getData(); // Refresh data after insertion
  }

  void updateData(ToDoModel toDoModel, int id) async {
    await sqlDatabase.updateData(toDoModel, id);
    getData(); // Refresh data after update
  }

  void deleteData(int id) async {
    await sqlDatabase.deleteData(id);
    getData(); // Refresh data after deletion
  }

  // void sortByPriority() {
  //   final List<ToDoModel> currentState = List.from(state);
  //   currentState.sort((a, b) => a.priority.compareTo(b.priority));
  //   emit(currentState);
  // }

  // void sortByDueDate() {
  //   final List<ToDoModel> currentState = List.from(state);
  //   currentState.sort((a, b) => a.dueDate.compareTo(b.dueDate));
  //   emit(currentState);
  // }

  // void sortByCreationDate() {
  //   final List<ToDoModel> currentState = List.from(state);
  //   currentState.sort((a, b) => a.creationDate.compareTo(b.creationDate));
  //   emit(currentState);
  // }
}
