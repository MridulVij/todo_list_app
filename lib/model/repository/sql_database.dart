import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/model/model/todo_model.dart';

class SQLDatabase {
  String _dataBaseName = "todo";
  final String _tableName = "todoTable";
  static late Database _db;
  int? _id;
  get id => _id;

  Future<void> initializeDatabase() async {
    // here we are initializing the database

    Directory applicationDirectory = await getApplicationDocumentsDirectory();

    String databasePath = "${applicationDirectory.path}$_dataBaseName.db";
    print(databasePath);
    // here we are creating the database
    _db = await openDatabase(databasePath, version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE todoTable(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt TEXT, setDueDate TEXT, setDueTime INTEGER, setPriority INTEGER)');
    });
    print(_db);
  }

  Future<List<ToDoModel>> readData() async {
    final result = await _db.query(_tableName);

    List<ToDoModel> notesModel =
        result.map((e) => ToDoModel.fromJson(e)).toList();

    return notesModel;
  }

  Future<void> insertData(ToDoModel model) async {
    final result = await _db.insert(_tableName, model.toJson());
    _id = result;
    print(result);
  }

  Future<void> deleteData(int Id) async {
    final result =
        await _db.delete(_tableName, where: "id = ?", whereArgs: [Id]);

    print(result);
  }

  Future<void> updateData(ToDoModel model, int Id) async {
    final result = await _db
        .update(_tableName, model.toJson(), where: "id = ?", whereArgs: [Id]);

    print(result);
  }
}
