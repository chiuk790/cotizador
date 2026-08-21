import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'quotes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE quotes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            clientName TEXT,
            productName TEXT,
            quantity INTEGER,
            totalAmount REAL,
            createdAt TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertQuote(Map<String, dynamic> quote) async {
    final db = await this.db;
    await db.insert('quotes', quote);
  }

  Future<List<Map<String, dynamic>>> getAllQuotes() async {
    final db = await this.db;
    return await db.query('quotes');
  }
}
