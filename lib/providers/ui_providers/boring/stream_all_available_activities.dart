import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/providers/data_repo_providers/repo_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_all_available_activities.g.dart';

@riverpod
Stream<List<ActivityEntity>> streamAllAvailableActivities(
    StreamAllAvailableActivitiesRef ref,
) {
  return ref.watch(activityRepoImplProvider).activityListStream();
}
