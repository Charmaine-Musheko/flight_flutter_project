

import 'package:flight_reminder/database/i_database_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/entities/user.dart';


class UserDataRepository {

  final  IDatabaseProvider dbProvider;

  UserDataRepository({required this.dbProvider});

  Future<int> insert(User user) async {
    final db = await dbProvider.database;

    return await db.insert(User.dbTableName, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<User?> update(int id,  String email) async {
    final db = await dbProvider.database;

    try{
      if(email.isNotEmpty) {
        await db.rawQuery('UPDATE Users SET email = ?', [email]);
      }
      return await get();
    }catch(e) {
      return await null;
    }
  }
  Future<User?> updateUser(int id, String email, 
      String firstname, String lastname,String address, String password) async {
    final db = await dbProvider.database;

    try {
      String query;
      List<dynamic> queryParams;

      if (email.isNotEmpty) {
        query =
            'UPDATE ${User.dbTableName} SET  email = ?, first_name = ?, last_name = ?, address = ?, password = ? WHERE user_id = ?';
        queryParams = [ email,  firstname, lastname, address, password, id];
      } else {
        query =
            'UPDATE ${User.dbTableName} SET  first_name = ?, last_name = ?, password = ? WHERE user_id = ?';
        queryParams = [ firstname, lastname, password, id];
      }

      await db.rawQuery(query, queryParams);

      return await get();
    } catch (e) {
      return null;
    }
  }
  
  Future<User?> get() async {
    final db = await dbProvider.database;
    List<Map> result = await db.rawQuery('SELECT * FROM ${User.dbTableName} LIMIT 1');
    return result.map((item) => User.fromJson(item)).toList().first;
  }

  Future<int> exists(int id) async {
    final db = await dbProvider.database;
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM ${User.dbTableName} WHERE user_id = ?', [id]));
    return count ?? 0;
  }
}
