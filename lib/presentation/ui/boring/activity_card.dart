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
  void initState() {
    isSelected =
        ref.read(selectedActivityProvider)?.id == widget.activityEntity.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ActivityEntity?>(
      selectedActivityProvider,
      onActivitySelected,
    );

    Widget avatar = isSelected
        ? Icon(
            Icons.check,
            color: Colors.green.shade800,
            size: 25,
          )
        : Text(
            widget.activityEntity.activityName[0],
            style: const TextStyle(
              color: Colors.black,
            ),
          );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        selectedTileColor: Colors.green.shade700.withOpacity(0.5),
        tileColor: Colors.grey.shade200,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: avatar,
        ),
        title: Text(widget.activityEntity.activityName),
        subtitle: Text(widget.activityEntity.activityType.name),
        selected: isSelected,
        onTap: () {
          if (isSelected) {
            ref.watch(selectedActivityProvider.notifier).unselectActivity();
          } else {
            ref.watch(selectedActivityProvider.notifier).selectActivity(
                  widget.activityEntity,
                );
          }
        },
      ),
    );
  }

  void onActivitySelected(ActivityEntity? previous, ActivityEntity? next) {
    bool isSelectedNow = next?.id == widget.activityEntity.id;
    if (isSelected != isSelectedNow) {
      setState(() {
        isSelected = isSelectedNow;
      });
    }
  }
}
