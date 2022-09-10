import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> getDB() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      join(await getDatabasesPath(), 'complee.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE taches(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, total INTEGER, completed INTEGER)",
        );
      },
      version: 1,
    );

    return database;
  }
}
