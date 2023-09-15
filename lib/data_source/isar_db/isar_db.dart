


import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:river_sample/data_source/isar_db/schemas/activity.dart';

class IsarDB {
  static IsarDB? _instance;

  factory IsarDB() {
    _instance ??= IsarDB._internal();
    return _instance!;
  }

  IsarDB._internal();
  
  late final Isar db;
  
  Future<void> openDB() async {
    var dir = await getApplicationDocumentsDirectory();
    db = await Isar.open(
      [ActivitySchema],
      directory: dir.path,
    );
  }
}