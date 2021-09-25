import 'package:ecommerce/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseCart {
  LocalDatabaseCart._();

  static final LocalDatabaseCart db = LocalDatabaseCart._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String _path = join(await getDatabasesPath(), 'CartProduct.db');
    Database _database = await openDatabase(_path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE cartProducts (
            name TEXT NOT NULL,
            image TEXT NOT NULL,
            price TEXT NOT NULL,
            quantity INTEGER NOT NULL,
            productId TEXT NOT NULL,
          )
      ''');
    });
    return _database;
  }

  Future<List<CartModel>> getAllProducts() async {
    Database _db = await database;
    List<Map> _maps = await _db.query('cartProducts');

    List<CartModel> _list = _maps.isNotEmpty
        ? _maps.map((cartProduct) => CartModel.fromJson(cartProduct)).toList()
        : [];
    return _list;
  }
}
