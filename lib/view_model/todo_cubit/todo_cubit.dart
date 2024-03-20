import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/model/model/todo_model.dart';

class TodoCubit extends Cubit<List<ToDoModel>> {
  TodoCubit() : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('todos');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final todos = jsonList.map((json) => ToDoModel.fromJson(json)).toList();
      emit(todos);
    }
  }

  Future<void> saveTodos(List<ToDoModel> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final List<dynamic> jsonList = todos.map((todo) => todo.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString('todos', jsonString);
  }

  void addToDo(String title, String description, DateTime setDueDateTime,
      DateTime createdAt, int setPriority) {
    final todo = ToDoModel(
      title: title,
      description: description,
      createdAt: createdAt,
      setDueDateTime: setDueDateTime,
      setPriority: setPriority,
    );
    final List<ToDoModel> updatedList = List.from(state)..add(todo);
    emit(updatedList);
    saveTodos(updatedList);
  }

  void deleteToDo(int index) {
    final List<ToDoModel> updatedList = List.from(state)..removeAt(index);
    emit(updatedList);
    saveTodos(updatedList);
  }

  void editToDo(int index, ToDoModel editedTodo) {
    final List<ToDoModel> updatedList = List.from(state)..[index] = editedTodo;
    emit(updatedList);
    saveTodos(updatedList);
  }

  void sortByPriority() {
    final List<ToDoModel> sortedList = List.from(state);
    sortedList.sort((a, b) => a.setPriority.compareTo(b.setPriority));
    emit(sortedList);
  }

  void sortByCreationDate() {
    final List<ToDoModel> sortedList = List.from(state);
    sortedList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    emit(sortedList);
  }

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
