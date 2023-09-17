import 'dart:async';
import 'dart:developer';

import 'package:river_sample/data_source/repo/local_activity_repo.dart';
import 'package:river_sample/data_source/repo/network_activity_repo.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/domain/repositories/activity_repo.dart';

import '../isar_db/schemas/activity.dart';

class ActivityRepoImpl extends ActivityRepo {
  final LocalActivityRepo localActivityRepo = LocalActivityRepo();
  final NetworkActivityRepo networkActivityRepo = NetworkActivityRepo();

  @override
  Future<ActivityEntity?> getActivity(ActivityType activityType,) async {
    try {
      Activity activity = await networkActivityRepo.fetchActivity(
        activityType,
      );
      localActivityRepo.saveActivity(activity);
      return activity.getActivityEntity();
    }  catch (e) {
      log("EXCEPTION IN GET ACTIVITY - $e");
    }
    return null;
  }

  @override
  Stream<List<ActivityEntity>> getAllActivity() {
    return localActivityRepo.activityListStream().transform(
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

