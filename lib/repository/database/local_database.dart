import 'package:flutter/material.dart';
import 'package:show_off/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._();
  static final String tableName = 'User';
  static final String id = 'id';
  static final String name = 'name';
  static final String address = 'address';
  static final String description = 'description';
  static final String avatarUrl = 'avatar_url';
  static final String dbFileName = 'show_off_db.db';

  final String createTableStatement = "CREATE TABLE $tableName ( "
      " $id INTEGER PRIMARY KEY,"
      " $name TEXT,"
      " $address TEXT,"
      " $description TEXT,"
      " $avatarUrl TEXT "
      ")";

  LocalDatabase._();

  factory LocalDatabase() {
    return _instance;
  }

  static LocalDatabase getInstance() {
    return _instance;
  }

  Database _database;

  Future<Database> getDatabase() async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await openDb();
    return _database;
  }

  Future<Database> openDb() async {
    var database;
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, dbFileName);
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(createTableStatement);
        },
      );
    } catch (exception) {
      print('openDb exception = ' + exception.toString());
      debugPrintStack();
    }
    return database;
  }

  Future<void> insertListUser(List<User> listUsers) async {
    try {
      final Database database = await getDatabase();
      for (User user in listUsers) {
        await database.insert(
          tableName,
          user.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    } catch (exception) {
      print('insertListUser exception = ' + exception.toString());
      debugPrintStack();
    }
  }

  Future<List<User>> getListUser() async {
    List<Map<String, dynamic>> listUser = [];
    try {
      final Database database = await getDatabase();
      listUser = await database.query(tableName);
      print('listUser = ' + listUser.toString());
    } catch (exception) {
      // print('getListUser exception = ' + exception.toString());
      // debugPrintStack();
    }
    return List.generate(
      listUser.length,
      (index) => User(
        id: listUser[index][id],
        name: listUser[index][name],
        avatarUrl: listUser[index][avatarUrl],
        address: listUser[index][address],
        description: listUser[index][description],
      ),
    );
  }

  Future<bool> isTableUserEmpty() async {
    List<User> listUser = [];
    listUser = await getListUser();
    print('listEmpty = ' + listUser.isEmpty.toString());
    return listUser.isEmpty;
  }
}
