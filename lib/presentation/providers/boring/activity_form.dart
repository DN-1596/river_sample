import 'package:river_sample/data_source/repo_providers.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/domain/entity_manager/activity_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_form.g.dart';

@riverpod
class ActivityForm extends _$ActivityForm {
  final List<ActivityEntity> _fetchedActivities = [];

  @override
  List<ActivityEntity> build() {
    return [];
  }

  void fetchActivity(ActivityType activityType) async {
    ActivityEntity? act =
        await ref.watch(activityManagerProvider.notifier).fetchNewActivity(
              activityType,
              ref.watch(activityRepoImplProvider),
            );
    if (act != null) {
      _fetchedActivities.add(act);
    }
    state = List.from(_fetchedActivities);
  }

  Stream<List<ActivityEntity>> fetchAllActivitiesFromDB() {
    return ref.watch(activityManagerProvider.notifier).fetchAllActivitiesFromDB(
          ref.watch(activityRepoImplProvider),
        );
  }
}
