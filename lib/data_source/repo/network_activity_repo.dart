import 'package:river_sample/data_source/isar_db/schemas/activity.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';

import '../network/activity_client.dart';

class NetworkActivityRepo {
  final ActivityClient activityClient = ActivityClient();

  Future<Activity> fetchActivity(ActivityType activityType) {
    return activityClient.fetchActivity(activityType.name);
  }
}
