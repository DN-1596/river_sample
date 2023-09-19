import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/presentation/ui/components/general.dart';
import 'package:river_sample/providers/ui_providers/boring/activity_form_manager.dart';
import 'package:river_sample/shared/named_routes.dart';
import 'package:river_sample/shared/router_provider.dart';

class ActivityFormUI extends ConsumerWidget {
  const ActivityFormUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<ActivityType>(
                hint: const Text("Select Activity Type"),
                value: ref.watch(selectActivityTypeProvider),
                onChanged: (newValue) {
                  ref
                      .watch(selectActivityTypeProvider.notifier)
                      .selectActivityType(
                        newValue,
                      );
                },
                items: ActivityType.values.map(
                  (item) {
                    return DropdownMenuItem<ActivityType>(
                      value: item,
                      child: Text(item.name),
                    );
                  },
                ).toList(),
              ),
              spaceWidget,
              ElevatedButton(
                onPressed: () {
                  if (!ref.watch(fetchNewActivityListProvider).isLoading) {
                    ref
                        .watch(fetchNewActivityListProvider.notifier)
                        .fetchNewActivity();
                  }
                },
                child: Text(
                  ref.watch(fetchNewActivityListProvider).when(
                    data: (data) {
                      return 'Fetch New Activity';
                    },
                    error: (e, s) {
                      log("ERROR IN FETCHING ACTIVITY - $e");
                      return "ERROR IN FETCHING ACTIVITY";
                    },
                    loading: () {
                      return "Loading New Activity ...";
                    },
                  ),
                ),
              ),
              spaceWidget,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                ),
                onPressed: () {
                  ref.watch(appRouterProvider).push(
                        availableActivitiesRoute,
                      );
                },
                child: const Text("Select from all available activities"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
