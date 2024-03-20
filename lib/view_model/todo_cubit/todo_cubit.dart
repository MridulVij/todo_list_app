import 'package:bloc/bloc.dart';
import 'package:todo_list_app/model/model/todo_model.dart';

class TodoCubit extends Cubit<List<ToDoModel>> {
  TodoCubit() : super([]);

  // Method to add a new todo
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

  // Method to delete a todo by index
  void deleteToDo(int index) {
    final List<ToDoModel> newState = List.from(state);
    newState.removeAt(index);
    emit(newState);
  }

  // Method to edit a todo at a given index
  void editToDo(int index, ToDoModel editedTodo) {
    final List<ToDoModel> newState = List.from(state);
    newState[index] = editedTodo;
    emit(newState);
  }

  // Method to sort todos by priority
  void sortByPriority() {
    final List<ToDoModel> sortedList = List.from(state);
    sortedList.sort((a, b) => a.setPriority.compareTo(b.setPriority));
    emit(sortedList);
  }

  // Method to sort todos by creation date
  void sortByCreationDate() {
    final List<ToDoModel> sortedList = List.from(state);
    sortedList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    emit(sortedList);
  }

  // Method to sort todos by due date
  void sortByDueDate() {
    final List<ToDoModel> sortedList = List.from(state);
    sortedList.sort((a, b) => a.setDueDateTime.compareTo(b.setDueDateTime));
    emit(sortedList);
  }

  void searchByTitle(String query) {
    final List<ToDoModel> filteredList = state
        .where((todo) => todo.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(filteredList);
  }
}
