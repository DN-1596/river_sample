

import 'package:river_sample/data_source/isar_db/schemas/activity.dart';

import 'activity_client.dart';

class NetworkActivityRepoImpl extends ActivityRepo {
  final ActivityClient activityClient = ActivityClient();

  @override
  Future<Activity> getActivity(ActivityType activityType) async {
    return activityClient.fetchActivity(activityType.name);
  }

  @override
  Future<bool> saveActivity(Activity activityType) async {
    /// NOT NEEDED
    return true;
  }
}
