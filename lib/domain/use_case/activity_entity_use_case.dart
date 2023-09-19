import 'package:river_sample/domain/repositories/activity_repo.dart';

import '../entities/activity_entity.dart';

class ActivityEntityUseCase {
  final ActivityRepo activityRepo;

  ActivityEntityUseCase(
    this.activityRepo,
  );

  Stream<List<ActivityEntity>> streamAllAvailableActivities() {
    return activityRepo.activityListStream();
  }

  Future<ActivityEntity> fetchNewActivity(
    ActivityType activityType,
  ) async {
    return activityRepo.getActivity(activityType);
  }
}
