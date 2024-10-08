import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../data/dao.dart';

class HelperDataBase {
  Future<Database> getDataBase() async {
    final String path = join(await getDatabasesPath(), 'crud.db');
    Database database = await openDatabase(path, onCreate: (db, version) {
      db.execute(Dao.tableSql);
    }, version: 1);
    return database;
  }
}
