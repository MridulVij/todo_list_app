import 'dart:convert';

import 'package:flutter/material.dart';

class ToDoModel {
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime setDueDate;
  final TimeOfDay setDueTime;
  final int setPriority;

  ToDoModel({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.setDueDate,
    required this.setDueTime,
    required this.setPriority,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'setDueDate': setDueDate.millisecondsSinceEpoch,
      'setDueTime': setDueTime.hour,
      'setPriority': setPriority,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      title: map['title'] as String,
      description: map['description'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      setDueDate: DateTime.fromMillisecondsSinceEpoch(map['setDueDate'] as int),
      setDueTime: TimeOfDay(hour: map['setDueTime'] as int ?? 0, minute: 0),
      setPriority: map['setPriority'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // Method to check if current date and time match the user's selected date and time
  // bool isMatchingDateTime() {
  //   final now = DateTime.now();
  //   return now.year == setDueDate.year &&
  //       now.month == setDueDate.month &&
  //       now.day == setDueDate.day &&
  //       now.hour == setDueTime.hour &&
  //       now.minute == setDueTime.minute;
  // }
}
