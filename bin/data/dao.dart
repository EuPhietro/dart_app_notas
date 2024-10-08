import 'package:sqflite/sqflite.dart';
import '../data/data.dart';
import '../data/data.dart';

class Dao {
  HelperDataBase helperDataBase = HelperDataBase();
  static final String tableName = 'name';
  static String tableSql = 'CREATE TABLE task.db {'
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$tableName TEXT}';

  Future<List<String>> findAll() async {
    Database database = await helperDataBase.getDataBase();
    final List<Map<String, dynamic>> result = await database.query(tableSql);
    return toList(result);
  }

  insert<String>(String note) async {
    
  }
  delet<String>(String note) async {}

  List<String> toList(List<Map<String, dynamic>> listaDeTarefas) {
    print('Convertendo um mapa em lista');
    List<String> lista = [];
    for (Map<String, dynamic> linha in listaDeTarefas) {
      String nota = linha[tableName];
      lista.add(nota);
    }
    return lista; 
  }
}
