import 'dart:async';

import 'package:isar/isar.dart';
import 'package:river_sample/data_source/isar_db/isar_db.dart';
import '../isar_db/schemas/activity.dart';

class LocalActivityRepo {
  Isar db = IsarDB().db;

  Stream<List<Activity>> activityListStream() {
    return db.activitys.filter().activityIsNotEmpty().watch();
  }

  Future<void> saveActivity(Activity activity) async {
    db.writeTxn(() async {
      await db.activitys.put(activity);
    });
  }
}
