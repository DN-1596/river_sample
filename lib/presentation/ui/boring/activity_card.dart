import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/presentation/providers/boring/selected_activity.dart';

class ActivityCard extends ConsumerStatefulWidget {
  final ActivityEntity activityEntity;

  const ActivityCard({
    super.key,
    required this.activityEntity,
  });

  @override
  ConsumerState<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends ConsumerState<ActivityCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      selectedActivityProvider,
      (previous, next) => onActivitySelected(next),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        key: UniqueKey(),
        selectedTileColor: Colors.green.shade700.withOpacity(0.5),
        tileColor: Colors.grey.shade200,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            widget.activityEntity.activityName[0],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        title: Text(widget.activityEntity.activityName),
        subtitle: Text(widget.activityEntity.activityType.name),
        selected: isSelected,
        onTap: () {
          ref.watch(selectedActivityProvider.notifier).selectActivity(
                isSelected ? null : widget.activityEntity,
              );
        },
      ),
    );
  }

  void onActivitySelected(ActivityEntity? selectedActivity) {
    bool isSelectedNow = selectedActivity?.id == widget.activityEntity.id;
    if (isSelected != isSelectedNow) {
      setState(() {
        isSelected = isSelectedNow;
      });
    }
  }
}
