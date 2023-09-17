


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/presentation/providers/boring/activity_form.dart';
import 'package:river_sample/presentation/ui/boring/activity_list.dart';

class NewActivityList extends ConsumerStatefulWidget {
  const NewActivityList({super.key});

  @override
  ConsumerState<NewActivityList> createState() => _NewActivityListState();
}

class _NewActivityListState extends ConsumerState<NewActivityList> {
  late List<ActivityEntity> acts;
  @override
  void initState() {
    acts = ref.read(activityFormProvider);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<ActivityEntity> acts = ref.watch(activityFormProvider);
    return ActivityList(
      activityEntityList: acts,
    );
  }
}
