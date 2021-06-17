import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDb {
  static final String databaseName = 'florist.db';
  static final String tableWishlist = 'wishlist';

  AppDb._();

  static final AppDb dbLocal = AppDb._();
  static Database db;

  Future<Database> setupDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, databaseName);
    db = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    return db;
  }

  Future<void> clearDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, databaseName);
    await db.close();
    await deleteDatabase(path);
    await setupDatabase();
  }

  Future<void> onCreate(Database database, int version) async {
    await database.execute(
      "CREATE TABLE $tableWishlist (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, product_id INTEGER, quantity INTEGER)",
    );
  }

  Future<Database> get database async {
    if (db != null) return db;
    db = await setupDatabase();
    return db;
  }

  Future<int> addItemWL({int productId, int quantity}) async {
    final db = await database;
    int id = await db.insert(tableWishlist, {
      'email': SharedPrefs.getEmail(),
      'product_id': productId,
      'quantity': quantity
    });
    return id;
  }

  Future<List<int>> getWishlist() async {
    final db = await database;
    var list = await db.query(tableWishlist,
        columns: ['product_id'],
        where: 'email = ?',
        whereArgs: [SharedPrefs.getEmail()]);
    List<int> listWL =[];
    list.forEach((element) {
      listWL.add(element['product_id']);
    });
    return listWL;
  }

  Future<List<ProductWL>> getWishlistQuantity() async {
    final db = await database;
    var list = await db.query(tableWishlist,
        columns: ['product_id','quantity'],
        where: 'email = ?',
        whereArgs: [SharedPrefs.getEmail()]);
    List<ProductWL> listWL = [];
    list.forEach((element) {
      ProductWL productWL = ProductWL.fromJson(element);
      listWL.add(productWL);
    });
    return listWL;
  }

  Future<int> updateItemWL({int productId, int quantity}) async {
    final db = await database;
    return await db.update(
      tableWishlist,
      {'quantity': quantity},
      where: "email = ? AND product_id = ?",
      whereArgs: [SharedPrefs.getEmail(), productId],
    );
  }

  Future<int> deleteItemWL({int productId}) async {
    final db = await database;
    return await db.delete(
      tableWishlist,
      where: "email = ? AND product_id = ?",
      whereArgs: [SharedPrefs.getEmail(), productId],
    );
  }

  Future<void> onUpgrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) async {}

  static final AppDb _instance = AppDb._internal();

  factory AppDb() {
    return _instance;
  }

  AppDb._internal();
}
