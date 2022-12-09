import 'package:nodaliza_store/data/sqfldb.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String columnId = 'id';
const String columnName = 'name';
const String columnPrice = 'price';
const String columnIsChecked = 'isChecked';
const String columnIsFavourite = 'isFavourite';
const String productTable = 'product_table';

class ShoppingHelper {
  late Database db;

  static final ShoppingHelper instance = ShoppingHelper._internal();

  factory ShoppingHelper() {
    return instance;
  }

  ShoppingHelper._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'shop.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table $productTable ( 
  $columnId integer primary key autoincrement, 
  $columnName text not null,
  $columnPrice integer not null,
  $columnIsChecked integer not null,
  $columnIsFavourite integer not null
  )
''');
    });
  }

  Future<Shopping> insertShopping(Shopping product) async {
    product.id = await db.insert(productTable, product.toMap());
    return product;
  }

  Future<int> deleteShopping(int id) async {
    return await db
        .delete(productTable, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateShopping(Shopping product) async {
    return await db.update(productTable, product.toMap(),
        where: '$columnId = ?', whereArgs: [product.id]);
  }

  Future<List<Shopping>> getAllShopping() async {
    List<Map<String, dynamic>> productMaps = await db.query(productTable);
    if (productMaps.isEmpty) {
      return [];
    } else {
      List<Shopping> shop = [];
      for (var element in productMaps) {
        shop.add(Shopping.fromMap(element));
      }
      return shop;
    }
  }

  Future close() async => db.close();
}
