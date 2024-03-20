import 'package:bloc/bloc.dart';
import 'package:todo_list_app/model/model/todo_model.dart';

class TodoCubit extends Cubit<List<ToDoModel>> {
  TodoCubit() : super([]);

  void addToDo(String title, String description, DateTime setDueDateTime,
      DateTime createdAt, int setPriority) {
    final todo = ToDoModel(
        title: title,
        description: description,
        createdAt: createdAt,
        setDueDateTime: setDueDateTime,
        setPriority: setPriority);
    emit([...state, todo]);
  }

  void deleteToDo(int index) {
    final List<ToDoModel> newState = List.from(state);
    newState.removeAt(index);
    emit(newState);
  }

  void editToDo(int index, ToDoModel editedTodo) {
    final List<ToDoModel> newState = List.from(state);
    newState[index] = editedTodo;
    emit(newState);
  }
}
