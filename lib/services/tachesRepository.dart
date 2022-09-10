import 'package:complee/models/tache.dart';
import 'package:sqflite/sqflite.dart';
import 'package:complee/services/dbHelper.dart';

class TachesRepository {
  late final DBHelper dbHelper;

  TachesRepository() {
    dbHelper = DBHelper();
  }

  //get all taches
  Future<List<Tache>> getAllTaches() async {
    final Database db = await dbHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query('taches');

    return List.generate(maps.length, (i) {
      return Tache(
        id: maps[i]['id'],
        name: maps[i]['name'],
        total: maps[i]['total'],
        completed: maps[i]['completed'],
      );
    });
  }

  //get tache by id
  Future<Tache> getTacheById(int id) async {
    final Database db = await dbHelper.getDB();
    final List<Map<String, dynamic>> maps =
        await db.query('taches', where: "id = ?", whereArgs: [id], limit: 1);

    return Tache(
      id: maps[0]['id'],
      name: maps[0]['name'],
      total: maps[0]['total'],
      completed: maps[0]['completed'],
    );
  }

  //insert tache
  Future<void> insertTache(Tache tache) async {
    final Database db = await dbHelper.getDB();
    await db.insert(
      'taches',
      tache.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // delete tache
  Future<void> deleteTache(int id) async {
    final db = await dbHelper.getDB();
    await db.delete(
      'taches',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
