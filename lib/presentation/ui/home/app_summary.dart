import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/presentation/ui/components/general.dart';
import 'package:river_sample/presentation/ui/home/selected_activity_ui.dart';
import 'package:river_sample/presentation/ui/presser/press_count_tracker.dart';

import '../../../providers/index.dart';

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
              child: Builder(
                builder: (context) {
                  int count  = ref.watch(streamAllAvailableActivitiesProvider).when(
                    data: (data) {
                      return data.length;
                    },
                    error: (e, s) {
                      return 0;
                    },
                    loading: () {
                      return 0;
                    },
                  );
                  return Text(
                    "Available Activity count - $count",
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
