

import 'package:river_sample/domain/entities/activity_entity.dart';

abstract class  ActivityRepo {
  Future<ActivityEntity> getActivity(ActivityType activityType);
  Stream<List<ActivityEntity>> activityListStream();
}
