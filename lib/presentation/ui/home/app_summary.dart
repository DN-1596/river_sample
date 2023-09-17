import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/data_source/repo_providers.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/domain/entity_manager/activity_manager.dart';
import 'package:river_sample/presentation/ui/components/general.dart';
import 'package:river_sample/presentation/ui/home/selected_activity_ui.dart';
import 'package:river_sample/presentation/ui/presser/press_count_tracker.dart';

class AppSummary extends ConsumerWidget {
  const AppSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          spaceWidget,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "APP SUMMARY",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          spaceWidget,
          const PressCountTracker(),
          spaceWidget,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: StreamBuilder<List<ActivityEntity>>(
                stream: ref
                    .watch(activityManagerProvider.notifier)
                    .fetchAllAvailableActivities(
                      ref.watch(activityRepoImplProvider),
                    ),
                builder: (context, snapshot) {
                  return Text(
                    "Available Activity count - ${snapshot.data?.length ?? 0}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "SELECTED ACTIVITY",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SelectedActivityUI(),
        ],
      ),
    );
  }
}
