import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/inventory_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'inventory.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE inventory(
        id TEXT PRIMARY KEY,
        productName TEXT,
        description TEXT,
        price REAL,
        quantity INTEGER
      )
    ''');
  }

  // Insert item
  Future<int> insertItem(InventoryItem item) async {
    Database db = await instance.database;
    return await db.insert('inventory', item.toMap());
  }

  // Get all items
  Future<List<InventoryItem>> getAllItems() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('inventory');
    return List.generate(maps.length, (i) {
      return InventoryItem(
        id: maps[i]['id'],
        productName: maps[i]['productName'],
        description: maps[i]['description'],
        price: maps[i]['price'],
        quantity: maps[i]['quantity'],
      );
    });
  }

  // Update item
  Future<int> updateItem(InventoryItem item) async {
    Database db = await instance.database;
    return await db.update(
      'inventory',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  // Delete item
  Future<int> deleteItem(String id) async {
    Database db = await instance.database;
    return await db.delete(
      'inventory',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}