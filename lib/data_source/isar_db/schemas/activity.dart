import 'package:isar/isar.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';

part 'activity.g.dart';

@collection
class Activity {
  Id id = Isar.autoIncrement;
  String activity;
  int? participants;
  String? key;
  String type;

  Activity({
    this.key,
    this.participants,
    required this.type,
    required this.activity,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json["activity"] ?? "",
      key: json["key"],
      participants: json["participants"],
      type: json["type"] ?? "",
    );
  }

  ActivityEntity getActivityEntity() {
    return ActivityEntity(
      activityType: ActivityType.getActivityType(type),
      activityName: activity,
      id: id,
    );
  }
}
