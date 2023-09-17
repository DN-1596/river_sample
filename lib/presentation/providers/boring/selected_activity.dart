


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_activity.g.dart';

@riverpod
class SelectedActivity extends _$SelectedActivity {

  @override
  ActivityEntity? build() {
    return null;
  }

  void selectActivity(ActivityEntity? activityEntity) {
    state = activityEntity;
  }
}
