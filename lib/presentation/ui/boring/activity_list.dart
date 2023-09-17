import 'package:flutter/material.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/presentation/ui/boring/activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<ActivityEntity> activityEntityList;

  const ActivityList({
    super.key,
    required this.activityEntityList,
  });

  @override
  Widget build(BuildContext context) {
    if (activityEntityList.isEmpty) {
      return const Text("No new activities available");
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: activityEntityList.length,
      itemBuilder: (context, i) {
        return ActivityCard(
          key: Key(
            activityEntityList[i].id.toString(),
          ),
          activityEntity: activityEntityList[i],
        );
      },
    );
  }
}
