import 'dart:convert';

import 'package:isar/isar.dart';

part 'activity.g.dart';

@collection
class Activity {
  Id id = Isar.autoIncrement;
  String? activity;
  String? type;
  int? participants;
  String? key;

  Activity({
    this.activity,
    this.key,
    this.participants,
    this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json["activity"],
      key: json["key"],
      participants: json["participants"],
      type: json["type"],
    );
  }
}

enum ActitvityType {}
