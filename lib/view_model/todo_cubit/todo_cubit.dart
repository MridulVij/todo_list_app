import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/model/model/todo_model.dart';

class TodoCubit extends Cubit<List<ToDoModel>> {
  TodoCubit() : super([]) {
    //
  }
}
