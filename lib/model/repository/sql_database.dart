import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../model/todo_model.dart';

class SQLDatabase {
  static var database;
// Initialize Database
  static Future<void> initializeDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
    );
  }

// Create Table
  static Future<void> createTable() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE todoTable(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createdAt TEXT, setDueDate TEXT, setDueTime INTEGER, setPriority INTEGER)');
      },
      version: 1,
    );
  }

// Insert Database
  // Define a function that inserts dogs into the database
  static Future<void> insertData(ToDoModel toDoModel) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'toDoModel',
      toDoModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// Get Data From Database
  // A method that retrieves all the dogs from the dogs table.
  static Future<List<ToDoModel>> getData() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all the dogs.
    final List<Map<String, Object?>> toDoModelMaps =
        await db.query('toDoModel');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {
            'id': id as int,
            'title': title as String,
            'description': description as String,
            'createdAt': createdAt as String,
            'setDueDate': setDueDate as String,
            'setDueTime': setDueTime as String,
            'setPriority': setPriority as int,
          } in toDoModelMaps)
        //
        ToDoModel(
            id: id,
            createdAt: createdAt,
            description: description,
            setDueDate: setDueDate,
            setDueTime: setDueTime,
            setPriority: setPriority,
            title: title),
    ];
  }

// Update Database
  static Future<void> updateDog(ToDoModel toDoModel) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'toDoModel',
      toDoModel.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [toDoModel.id],
    );
  }

// Delete Database
  static Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'toDoModel',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
