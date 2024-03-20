import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'setDueDateTime': setDueDateTime.millisecondsSinceEpoch,
      'setPriority': setPriority,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      title: map['title'] as String,
      description: map['description'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      setDueDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['setDueDateTime'] as int),
      setPriority: map['setPriority'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
