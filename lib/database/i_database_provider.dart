import 'package:sqflite/sqflite.dart' as sql;

abstract class IDatabaseProvider {

  Future<sql.Database> get database;
  
  Future<void> deleteDb();
}