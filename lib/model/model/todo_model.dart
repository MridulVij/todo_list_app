// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ToDoModel {
  int _Id;
  String _title;
  String _description;
  DateTime _createdAt;
  DateTime _setDueDate;
  TimeOfDay _setDueTime;
  int _setPriority;

  ToDoModel(
    this._Id,
    this._title,
    this._description,
    this._createdAt,
    this._setDueDate,
    this._setDueTime,
    this._setPriority,
  );

  int get Id => _Id;
  int get setPriority => _setPriority;
  String get title => _title;
  String get description => _description;
  DateTime get createdAt => _createdAt;
  DateTime get setDueDate => _setDueDate;
  TimeOfDay get setDueTime => _setDueTime;

  set description(String value) {
    this._description = value;
  }

  set title(String value) {
    this._title = value;
  }

  set Id(int value) {
    this._Id = value;
  }

  set createdDate(DateTime value) {
    this._createdAt = value;
  }

  set setDueDate(DateTime value) {
    this._setDueDate = value;
  }

  set setDueTime(TimeOfDay value) {
    this._setDueTime = value;
  }

  set setPriority(int value) {
    this._setPriority = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (Id != null) {
      map['Id'] = _Id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['setPriority'] = _setPriority;
    map['createdAt'] = _createdAt;
    map['setDueDate'] = _setDueDate;
    map['setDueTime'] = _setDueTime;

    return map;
  }

  ToDoModel.fromMap(Map<String, dynamic> map) {
    this._Id = map['Id'];
    this._title = map['title'];
    this._description = map['description'];
    this._createdAt = map['createdDate'];
    this._setDueDate = map['setDueDate'];
    this._setDueTime = map['setDueTime'];
    this._setPriority = map['setPriority'];
  }
}
