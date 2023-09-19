import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain_providers/activity_entity_use_case_provider.dart';

part 'stream_all_available_activities.g.dart';

@riverpod
Stream<List<ActivityEntity>> streamAllAvailableActivities(
    StreamAllAvailableActivitiesRef ref,
) {
  return ref.watch(activityEntityUseCaseProvider).streamAllAvailableActivities();
}
