// GENERATED CODE - DO NOT MODIFY BY HAND
// Emitted on: 2019-06-04 10:36:58.699832

// **************************************************************************
// Generator: OrmM8GeneratorForAnnotation
// **************************************************************************

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:hello_world_f_orm_m8/models/independent/gym_location.dart';

class GymLocationProxy extends GymLocation {
  GymLocationProxy();

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['description'] = description;

    return map;
  }

  GymLocationProxy.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.description = map['description'];
  }
}

mixin GymLocationDatabaseProvider {
  Future<Database> db;
  final theGymLocationColumns = ["id", "description"];

  final String theGymLocationTableHandler = 'gym_locations';
  Future createGymLocationTable(Database db) async {
    await db.execute('''CREATE TABLE $theGymLocationTableHandler (
    id INTEGER  PRIMARY KEY AUTOINCREMENT,
    description TEXT ,
    UNIQUE (description)
    )''');
  }

  Future<int> saveGymLocation(GymLocationProxy instanceGymLocation) async {
    var dbClient = await db;

    var result = await dbClient.insert(
        theGymLocationTableHandler, instanceGymLocation.toMap());
    return result;
  }

  Future<List<GymLocationProxy>> getGymLocationProxiesAll() async {
    var dbClient = await db;
    var result = await dbClient.query(theGymLocationTableHandler,
        columns: theGymLocationColumns, where: '1');

    return result.map((e) => GymLocationProxy.fromMap(e)).toList();
  }

  Future<int> getGymLocationProxiesCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery('SELECT COUNT(*) FROM $theGymLocationTableHandler  WHERE 1'));
  }

  Future<GymLocationProxy> getGymLocation(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(theGymLocationTableHandler,
        columns: theGymLocationColumns, where: '1 AND id = ?', whereArgs: [id]);

    if (result.length > 0) {
      return GymLocationProxy.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteGymLocation(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(theGymLocationTableHandler, where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> deleteGymLocationProxiesAll() async {
    var dbClient = await db;
    await dbClient.delete(theGymLocationTableHandler);
    return true;
  }

  Future<int> updateGymLocation(GymLocationProxy instanceGymLocation) async {
    var dbClient = await db;

    return await dbClient.update(
        theGymLocationTableHandler, instanceGymLocation.toMap(),
        where: "id = ?", whereArgs: [instanceGymLocation.id]);
  }
}
