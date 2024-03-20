// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDoModel {
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime setDueDateTime;
  final int setPriority;

  ToDoModel({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.setDueDateTime,
    required this.setPriority,
  });
}
