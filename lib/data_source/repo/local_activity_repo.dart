import 'dart:async';

import 'package:isar/isar.dart';
import 'package:river_sample/data_source/isar_db/isar_db.dart';
import '../isar_db/schemas/activity.dart';

class LocalActivityRepo {

  Stream<List<Activity>> activityListStream() {
    return IsarDB().db.activitys.filter().activityIsNotEmpty().watch();
  }

  Future<void> saveActivity(Activity activity) async {
    IsarDB().db.writeTxn(() async {
      await IsarDB().db.activitys.put(activity);
    });
  }
}
