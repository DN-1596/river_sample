import 'dart:async';

import 'package:river_sample/data_source/repo/local_activity_repo.dart';
import 'package:river_sample/data_source/repo/network_activity_repo.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/domain/repositories/activity_repo.dart';

import '../isar_db/schemas/activity.dart';

class ActivityRepoImpl extends ActivityRepo {
  final LocalActivityRepo _localActivityRepo = LocalActivityRepo();
  final NetworkActivityRepo _networkActivityRepo = NetworkActivityRepo();

  @override
  Future<ActivityEntity> getActivity(ActivityType activityType,) async {
    Activity activity = await _networkActivityRepo.fetchActivity(
      activityType,
    );
    _localActivityRepo.saveActivity(activity);
    return activity.getActivityEntity();
  }

  @override
  Stream<List<ActivityEntity>> activityListStream() {
    return _localActivityRepo.activityListStream().transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(
            data.map((e) => e.getActivityEntity()).toList(),
          );
        },
      ),
    );
  }
}

