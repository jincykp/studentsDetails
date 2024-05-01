import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db');
    var database = await openDatabase(path, version: 1,
        onCreate: (Database data, int version) async {
      String sql =
          "CREATE TABLE student(id INTEGER PRIMARY KEY, name TEXT, age TEXT, contact TEXT, Reg TEXT,photo TEXT,address TEXT);";
      await data.execute(sql);
    }, onUpgrade: (Database data, int oldversion, int newversion) async {
      if (oldversion < 2) {
        await data.execute("ALTER TABLE student ADD COLOMN address text");
      }
    });
    return database;
  }
}
