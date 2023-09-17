import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/presentation/providers/boring/selected_activity.dart';
import 'package:river_sample/presentation/ui/boring/activity_card.dart';

class SelectedActivityUI extends ConsumerWidget {
  const SelectedActivityUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ActivityEntity? act = ref.watch(selectedActivityProvider);
    return act == null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: const Text("-- No activity selected to kill BOREDOM")),
          )
        : ActivityCard(
            activityEntity: act,
          );
  }
}
