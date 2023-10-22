
import 'package:flight_reminder/database/i_database_provider.dart';
import 'package:flight_reminder/database/model/entities/user.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DatabaseProvider extends IDatabaseProvider {
  sql.Database? _db;

  @override
  Future<sql.Database> get database async {
    if (_db != null) return _db!;
    _db = await _createDatabase();
    return _db!;
  }

  Future<sql.Database> _createDatabase() async {
    final dbPath = await sql.getDatabasesPath();

    var db = await sql.openDatabase(
      path.join(dbPath, 'flight_reminder.db'),
      onCreate: (db, version) {
        db.execute(User.createTable);
  
        return;
      },
      // }, onUpgrade: (db, oldVersion, newVersion) async {

      //   var batch = db.batch();

      //   if (oldVersion == 1) {
      //     _alterAddressTable(batch);
      //   } else if (oldVersion == 2) {
      //     _alterDeliveryRequestTable(batch);
      //   } else {
      //     await _alterAddressTable(batch);
      //     await _alterDeliveryRequestTable(batch);
      //   }

      //   await batch.commit();
      // },
      version: 1,
    );

    return db;
  }

  @override
  Future<void> deleteDb() async {
    await _db!.transaction((txn) async {
      await txn.execute('DELETE FROM  ${User.dbTableName}');
      // await txn.execute('DELETE FROM ${Address.dbTableName}');
      // await txn.execute('DELETE FROM ${Contact.dbTableName}');
      // await txn.execute('DELETE FROM ${AddressContact.dbTableName}');
   
      // await txn.execute('DELETE FROM ${BankCard.dbTableName}');
      // await txn.execute('DELETE FROM ${Rate.dbTableName}');
    });
  }

  //   ///Migration 1
  // Future<void> _alterAddressTable(sql.Batch batch) async {
  //   //batch.execute('DROP TABLE IF EXISTS ${DocumentMeasurement.dbTableName}');
  //    batch.execute('ALTER TABLE ${Address.dbTableName} ADD COLUMN isActive INTEGER NOT NULL DEFAULT 1');
  // }

  // ///Migration 2
  // Future<void> _alterDeliveryRequestTable(sql.Batch batch) async{
  //   //batch.execute('DROP TABLE IF EXISTS ${DocumentMeasurement.dbTableName}');
  //   batch.execute('ALTER TABLE ${DeliveryRequest.dbTableName} ADD COLUMN collectionTimeFrom TEXT NOT NULL DEFAULT ""');
  //   batch.execute('ALTER TABLE ${DeliveryRequest.dbTableName} ADD COLUMN collectionTimeTo TEXT NOT NULL DEFAULT ""');
  //   batch.execute('ALTER TABLE ${DeliveryRequest.dbTableName} ADD COLUMN deliveryTimeFrom TEXT NOT NULL DEFAULT ""');
  //   batch.execute('ALTER TABLE ${DeliveryRequest.dbTableName} ADD COLUMN deliveryTimeTo TEXT NOT NULL DEFAULT ""');
  // }
}
