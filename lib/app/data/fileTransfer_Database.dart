import 'package:share_h/app/data/fileDetailAtrribute.dart';
import 'package:share_h/app/model/fileDetails.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FileTransferDatabase {
  static final FileTransferDatabase instance = FileTransferDatabase._init();

  static Database? _database;

  FileTransferDatabase._init();
  int? count;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes10.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print("path :$path -----------------------------------------------");

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER  PRIMARY KEY ';
    final textType = 'TEXT NOT NULL';
    final pathType = 'TEXT';

    await db.execute('''
  CREATE TABLE ${FileDetailAtrribute.tableName} (
 ${FileDetailAtrribute.id} $idType,
 ${FileDetailAtrribute.fileName} $textType,
 ${FileDetailAtrribute.location} $textType,
 ${FileDetailAtrribute.dateTime} $textType,
 )
  ''');
    print('user Info table created');
  }

  Future<FileDetails> insertInUserTable(FileDetails user) async {
    final db = await instance.database;
    print('object insert for history Database-----------------------');
    final id =
        await db.insert(FileDetailAtrribute.tableName, FileDetails().toJson());
    return FileDetails(id: id);
  }

  Future<List<FileDetails>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${FileDetailAtrribute.time} ASC';

    final result =
        await db.query(FileDetailAtrribute.tableName, orderBy: orderBy);

    return result.map((json) => FileDetails.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    print('object delete for user Information-----------------------');
    return await db.delete(
      FileDetailAtrribute.tableName,
      where: '${FileDetailAtrribute.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    print('object close for user Information-----------------------');
    final db = await instance.database;
    _database = null;
    db.close();
  }
}
