import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/model/model/todo_model.dart';

class SQLDatabase {
  String _dataBaseName = "todo";
  final String _tableName = "todoTable";
  static late Database _db;

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

    print(result);
  }

  Future<void> deleteData(int Id) async {
    final result =
        await _db.delete(_tableName, where: "Id = ?", whereArgs: [Id]);

    print(result);
  }

  Future<void> updateData(ToDoModel model, int Id) async {
    final result = await _db
        .update(_tableName, model.toJson(), where: "Id = ?", whereArgs: [Id]);

    print(result);
  }
}

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../model/todo_model.dart';

// class SQLDatabase {
//   static var database;
// // Initialize Database

//   static Future<void> initializeDatabase() async {
//     database = openDatabase(
//       join(await getDatabasesPath(), 'todo.db'),
//     );
//     print(database);
//   }

// // Create Table
//   static Future<void> createTable() async {
//     database = openDatabase(
//       join(await getDatabasesPath(), 'todo.db'),
//       onCreate: (db, version) {
//         return db.execute(
//             'CREATE TABLE todoTable(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt TEXT, setDueDate TEXT, setDueTime INTEGER, setPriority INTEGER)');
//       },
//       version: 1,
//     );
//     print(database);
//   }

// // Insert Database
//   // Define a function that inserts dogs into the database
//   static Future<void> insertData(ToDoModel toDoModel) async {
//     // Get a reference to the database.
//     final db = await database;

//     // Insert the Dog into the correct table. You might also specify the
//     // `conflictAlgorithm` to use in case the same dog is inserted twice.
//     //
//     // In this case, replace any previous data.
//     await db.insert(
//       'toDoModel',
//       toDoModel.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     print(db);
//   }

// // Get Data From Database
//   // A method that retrieves all the dogs from the dogs table.
//   static Future<List<ToDoModel>> getData() async {
//     // Get a reference to the database.
//     final db = await database;
//     print(db);

//     // Query the table for all the dogs.
//     final List<Map<String, Object?>> toDoModelMaps =
//         await db.query('toDoModel');

//     // Convert the list of each dog's fields into a list of `Dog` objects.
//     return [
//       for (final {
//             'id': id as int,
//             'title': title as String,
//             'description': description as String,
//             'createdAt': createdAt as String,
//             'setDueDate': setDueDate as String,
//             'setDueTime': setDueTime as String,
//             'setPriority': setPriority as int,
//           } in toDoModelMaps)
//         //
//         ToDoModel(
//             id: id,
//             createdAt: createdAt,
//             description: description,
//             setDueDate: setDueDate,
//             setDueTime: setDueTime,
//             setPriority: setPriority,
//             title: title),
//     ];
//   }

// // Update Database
//   static Future<void> updateData(ToDoModel toDoModel) async {
//     // Get a reference to the database.
//     final db = await database;

//     // Update the given Dog.
//     await db.update(
//       'toDoModel',
//       toDoModel.toMap(),
//       // Ensure that the Dog has a matching id.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [toDoModel.id],
//     );
//     print(db);
//   }

// // Delete Database
//   static Future<void> deleteData(int id) async {
//     // Get a reference to the database.
//     final db = await database;

//     // Remove the Dog from the database.
//     await db.delete(
//       'toDoModel',
//       // Use a `where` clause to delete a specific dog.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//     print(db);
//   }
// }
