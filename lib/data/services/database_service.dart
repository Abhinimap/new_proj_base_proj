import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService databaseService = DatabaseService._internal();

  factory DatabaseService() => databaseService;

  DatabaseService._internal();

  static Database? _database;

  final String _databaseName = 'database_name.db';

  static String _databasePath = '';

  final List<String> _onCreateScript = [
    'CREATE TABLE breeds(id INTEGER PRIMARY KEY, name TEXT, description TEXT)',
    'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, color INTEGER, breedId INTEGER, FOREIGN KEY (breedId) REFERENCES breeds(id) ON DELETE SET NULL)',
  ];

  final List<String> _migrationScripts = [];

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    // TODO: Add your database name here
    final path = join(databasePath, _databaseName);
    _databasePath = path;
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      version: _migrationScripts.length + 1,
      onCreate: _onCreate,
      onUpgrade: _onUpdate,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    for (String script in _onCreateScript) {
      await db.execute(script);
    }
  }

  Future<void> _onUpdate(Database db, int oldVersion, int newVersion) async {
    debugPrint("Old Version $oldVersion, New Version $newVersion");

    for (var i = oldVersion - 1; i < newVersion - 1; i++) {
      await db.execute(_migrationScripts[i]);
    }
  }
}
