import 'dart:developer';

import 'package:river_sample/domain/repositories/activity_repo.dart';
import 'package:river_sample/providers/data_repo_providers/repo_providers.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_form_manager.g.dart';

@riverpod
class FetchNewActivityList extends _$FetchNewActivityList {
  final List<ActivityEntity> _fetchedActivities = [];

  @override
  Future<List<ActivityEntity>> build() async {
    return _fetchedActivities;
  }

  void fetchNewActivity() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      ActivityEntity? fetchedActivity;
      ActivityRepo activityRepo = ref.watch(activityRepoImplProvider);
      ActivityType? selectedActivityType = ref.watch(
        selectActivityTypeProvider,
      );
      if (selectedActivityType != null) {
        fetchedActivity = await activityRepo.getActivity(
          selectedActivityType,
        );
        log("NEW ACTIVITY RECEIVED :: ${fetchedActivity?.activityName}");
      }
      _fetchedActivities.add(fetchedActivity!);
      return List.from(_fetchedActivities);
    });
  }
}

@riverpod
class SelectActivityType extends _$SelectActivityType {
  ActivityType? _selectedActivity;

  @override
  ActivityType? build() {
    return _selectedActivity;
  }

  void selectActivityType(ActivityType? activityType) {
    _selectedActivity = null;
    _selectedActivity = activityType;
    state = _selectedActivity;
  }
}
