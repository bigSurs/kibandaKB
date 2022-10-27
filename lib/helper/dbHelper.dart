
// import 'package:kibanda_kb/app/alert/alert.dart';
// import 'package:kibanda_kb/constants/constants.dart';
// import 'package:sqflite/sqflite.dart' as sql;
// import 'package:path/path.dart' as path;

// class DBHelper {
//   static Future<sql.Database> getDB() async {
//     final dbPath = await sql.getDatabasesPath();

//     return await sql.openDatabase(path.join(dbPath, 'kwikbasketShop.db'),
//         onCreate: (db, version) {
//       return db.execute('''CREATE TABLE ${Constants.cartTableName}
//               (
//                 id INTEGER PRIMARY KEY AUTOINCREMENT,
//                 productStoreId TEXT,
//                 variationName TEXT,
//                 productName TEXT,
//                 productThumb TEXT,
//                 type TEXT,
//                 notes TEXT,           
//                 priceSymbol TEXT,   
//                 productRate REAL,
//                 qty REAL,
//                 weight REAL,
//                 productId TEXT,
//                 productPrice REAL,
//                 percentageOff TEXT,
//                 storeId TEXT,
//                 storeName TEXT,
//                 taxClassId TEXT,
//                 taxPercentage TEXT,
//                 taxName TEXT,
//                 taxAmount REAL,
//                 storeProductVariationId REAL                
//               )''');
//     }, version: 2);
//   }

//   static Future<int> insert(String table, Map<String, dynamic> data) async {
//     final db = await DBHelper.getDB();
//     try {
//       final id = await db.insert(table, data,
//           conflictAlgorithm: sql.ConflictAlgorithm.abort);
//       return id;
//     } catch (e) {
//       messageTost("Please try again...");
//       throw e;
//     }
//   }

//   static Future<List<Map<String, dynamic>>> getData(String table) async {
//     try {
//       final db = await DBHelper.getDB();
//       var res = await db.query(table);
//       return res;
//     } catch (e) {
//       messageTost("Please try again...");
//       throw e;
//     }
//   }

//   static Future<int> removeById(String table, int id) async {
//     try {
//       final db = await DBHelper.getDB();

//       return await db.delete(table, where: "id=?", whereArgs: [id]);
//     } catch (e) {
//       messageTost("Please try again...");
//       throw e;
//     }
//   }

//   static Future<int> updateCart(
//       String table, Map<String, dynamic> data, int id) async {
//     try {
//       final db = await DBHelper.getDB();
//       return await db.update(table, data, where: "id=?", whereArgs: [id]);
//     } catch (e) {
//       messageTost("Please try again...");
//       throw e;
//     }
//   }

//   static Future<int> updateCartByProductId(
//       String table, Map<String, dynamic> data, String id) async {
//     try {
//       final db = await DBHelper.getDB();
//       return await db
//           .update(table, data, where: "productStoreId=?", whereArgs: [id]);
//     } catch (e) {
//       messageTost("Please try again...");
//       throw e;
//     }
//   }

//   static Future<void> cleanDatabase(String table) async {
//     try {
//       final db = await DBHelper.getDB();
//       await db.delete(table);
//     } catch (e) {
//       messageTost("Please try again...");
//       throw e;
//     }
//   }
// }
