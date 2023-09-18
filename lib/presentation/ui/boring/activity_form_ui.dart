import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/domain/entity_manager/activity_manager.dart';
import 'package:river_sample/presentation/providers/boring/activity_form_manager.dart';
import 'package:river_sample/presentation/ui/components/general.dart';
import 'package:river_sample/shared/named_routes.dart';
import 'package:river_sample/shared/router_provider.dart';

class ActivityFormUI extends ConsumerStatefulWidget {
  const ActivityFormUI({super.key});

  @override
  ConsumerState<ActivityFormUI> createState() => _ActivityFormUIState();
}

class _ActivityFormUIState extends ConsumerState<ActivityFormUI> {
  ActivityType? activityType;

  @override
  Widget build(BuildContext context) {
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
                value: activityType,
                onChanged: (newValue) {
                  setState(() {
                    activityType = newValue;
                  });
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
                  if (!ref.watch(activityManagerProvider).isLoading &&
                      activityType != null) {
                    ref
                        .watch(activityFormManagerProvider.notifier)
                        .fetchActivity(activityType!);
                  }
                },
                child: Text(
                  ref.watch(activityManagerProvider).isLoading
                      ? 'Loading New Activity ...'
                      : 'Fetch New Activity',
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
