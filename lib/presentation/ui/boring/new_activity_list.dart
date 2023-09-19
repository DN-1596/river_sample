import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/presentation/ui/boring/activity_list.dart';

import '../../../providers/index.dart';

class NewActivityList extends ConsumerWidget {
  const NewActivityList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ActivityEntity> acts = ref.watch(fetchNewActivityListProvider).when(
      data: (data) {
        return data;
      },
      error: (e, s) {
        log("ERROR IN FETCHING NEW ACTIVITY ENTITY - $e");
        return ref.watch(fetchNewActivityListProvider).value ?? [];
      },
      loading: () {
        return ref.watch(fetchNewActivityListProvider).value ?? [];
      },
    );
    return ActivityList(
      activityEntityList: acts,
    );
  }
}
