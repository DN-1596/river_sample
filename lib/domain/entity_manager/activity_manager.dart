import 'dart:developer';

import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/domain/repositories/activity_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_manager.g.dart';

@Riverpod(keepAlive: true)
class ActivityManager extends _$ActivityManager {
  @override
  FutureOr<ActivityEntity?> build() async {
    return Future.value(null);
  }

  Stream<List<ActivityEntity>> fetchAllAvailableActivities(
    ActivityRepo activityRepo,
  ) {
    return activityRepo.getAllActivity();
  }

  Future<ActivityEntity?> fetchNewActivity(
    ActivityType activityType,
    ActivityRepo activityRepo,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        ActivityEntity? activityEntity = await activityRepo.getActivity(
          activityType,
        );
        log("NEW ACTIVITY RECEIVED :: ${activityEntity?.activityName}");
        return activityEntity;
      },
    );
    return state.value;
  }
}
