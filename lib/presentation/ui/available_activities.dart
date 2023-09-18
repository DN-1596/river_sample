import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:river_sample/data_source/repo_providers.dart';
import 'package:river_sample/domain/entities/activity_entity.dart';
import 'package:river_sample/domain/entity_manager/activity_manager.dart';
import 'package:river_sample/presentation/ui/boring/activity_list.dart';

class AvailableActivities extends ConsumerWidget {
  const AvailableActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: StreamBuilder<List<ActivityEntity>>(
        stream: ref
            .watch(activityManagerProvider.notifier)
            .fetchAllAvailableActivities(
              ref.watch(activityRepoImplProvider),
            ),
        builder: (context, snapshot) {
          List<ActivityEntity> acts = snapshot.data ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.grey.shade400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Available Activity count - ${snapshot.data?.length ?? 0}",
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
          );
        },
      ),
    );
  }
}
