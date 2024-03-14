import 'package:exploring_localdbs/Src/Data/DataSource/Resources/dummy_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteServices {
  static final SqliteServices _sqliteServices = SqliteServices._internal();

  factory SqliteServices() => _sqliteServices;

  SqliteServices._internal();

  static Database? _sqfLite;
  static const String dbName = 'sq_photos.db';

  Future<Database> get database async {
    print("Is Sqlite Open: " + _sqfLite.toString());
    if (_sqfLite != null) {
      return _sqfLite!;
    }

    _sqfLite = await _initDatabase();
    return _sqfLite!;
  }

  Future<Database> _initDatabase() async {
    print("first init");

    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1, onCreate: _createPhotosTable);
  }

  Future<void> _createPhotosTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Photos (
        albumId INTEGER,
        id INTEGER,
        title TEXT,
        url TEXT,
        thumbnailUrl TEXT
      )
    ''');
    // await insertAllData();
  }

  Future insertAllData() async {
    Database db = await database;
    print(">>>insertAllData");
    for (final item in dummyData) {
      await db.insert('Photos', item);
    }
    print("ALL Photos Inserted in Sqlite");
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    Database db = await database;
    return await db.query('Photos');
  }

  Future initSqlite() async {
    await database;
  }
}
