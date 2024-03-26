import 'package:bloc/bloc.dart';
import 'package:todo_list_app/model/model/todo_model.dart';
import 'package:todo_list_app/model/repository/sql_database.dart';

// part of 'todo_state.dart';
class TodoCubit extends Cubit<List<ToDoModel>> {
  TodoCubit() : super([]);
  SQLDatabase sqlDatabase = SQLDatabase();
  List<ToDoModel> _todoData = [];

  List<ToDoModel> get getTodo => _todoData;

  void requestPermission() {
    sqlDatabase.initializeDatabase();
  }

  //
  void getData() async {
    _todoData = await sqlDatabase.readData();
    emit(_todoData);
  }

  void insertData(ToDoModel toDoModel) async {
    await sqlDatabase.insertData(toDoModel);
  }

  void updateData(ToDoModel toDoModel, int id) async {
    await sqlDatabase.updateData(toDoModel, id);
  }

  void deleteData(int id) async {
    await sqlDatabase.deleteData(id);
  }
  //
}
