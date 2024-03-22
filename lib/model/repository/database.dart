import 'package:sqflite/sqflite.dart' as sqf;

class SQFLiteDatabase {
  // Sqflite has been used to save data in local storage
  // Create Tables
  Future<void> createTables(sqf.Database database) async {
    await database.execute('''CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      desciption TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
''');
  }

  // Open Database
  Future<sqf.Database> db() async {
    return sqf.openDatabase('', version: 1,
        onCreate: (sqf.Database database, int version) async {
      await createTables(database);
    });
  }
}
