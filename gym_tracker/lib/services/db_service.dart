import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DBService {
  static Database? _db;

  static Future<void> init() async {
    if (_db != null) return;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "gymtracker.db");

    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE workouts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE exercises(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workout_id INTEGER,
        name TEXT,
        FOREIGN KEY (workout_id) REFERENCES workouts(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE logs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        exercise_id INTEGER,
        weight REAL,
        reps INTEGER,
        sets INTEGER,
        date TEXT,
        FOREIGN KEY (exercise_id) REFERENCES exercises(id)
      )
    ''');
  }

  static Future<Database> get database async {
    if (_db == null) await init();
    return _db!;
  }
}
