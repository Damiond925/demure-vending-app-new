import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;

  // Initialize Database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create the inventory table
        await db.execute('''
          CREATE TABLE inventory(
            id TEXT PRIMARY KEY,
            name TEXT,
            quantity INTEGER,
            price REAL
          )
        ''');
      },
    );
  }

  // Insert data into the inventory table
  Future<void> insertItem(Map<String, dynamic> item) async {
    final db = await database;
    await db.insert('inventory', item, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Retrieve all items
  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return await db.query('inventory');
  }

  // Update an item
  Future<void> updateItem(String id, Map<String, dynamic> updatedItem) async {
    final db = await database;
    await db.update('inventory', updatedItem, where: 'id = ?', whereArgs: [id]);
  }

  // Delete an item
  Future<void> deleteItem(String id) async {
    final db = await database;
    await db.delete('inventory', where: 'id = ?', whereArgs: [id]);
  }
}