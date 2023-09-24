// import 'dart:html';

// import 'package:sqflite/sqflite.dart';

// class SQLiteHelper {
//   static Future<Database> _db;

//   static Future<Database> getDB() {
//     _db ??= _initDB();
//     return _db;
//   }


//   static Future<Database> _initDB() async {
//     final db = await openDatabase(
//       join(await getDatabasesPath(), "odebin_db_local.db"),
//       version: 1,
//       onCreate: _onCreate,
//       // onConfigure: __onConfigure
//     );
//     return db;
//   }

//   static _onCreate(Database db, int version) async {
//     await db.execute(
//         "CREATE TABLE venta(id INTEGER PRIMERY KEY, name TEXT NOT NULL)");
//   }

//   // static _onConfigure(Database db) async{
//   //   await db.execute("PRAGMA foreing_keys=ON")
//   // }
// }
