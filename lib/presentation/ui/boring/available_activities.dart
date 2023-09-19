import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/presentation/ui/boring/activity_list.dart';

import '../../../providers/index.dart';

class AvailableActivities extends ConsumerWidget {
  const AvailableActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ActivityEntity> acts =
        ref.watch(streamAllAvailableActivitiesProvider).when(
      data: (data) {
        return data;
      },
      error: (e, s) {
        return [];
      },
      loading: () {
        return [];
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Activities"),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.grey.shade400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Available Activity count - ${acts.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: ActivityList(
              activityEntityList: acts,
            ),
          ),
        ],
      ),
    );
  }
}
