import 'package:river_sample/domain/use_case/activity_entity_use_case.dart';
import 'package:river_sample/providers/data_repo_providers/repo_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_entity_use_case_provider.g.dart';

@riverpod
ActivityEntityUseCase activityEntityUseCase(
  ActivityEntityUseCaseRef ref,
) {
  return ActivityEntityUseCase(
    ref.watch(activityRepoImplProvider),
  );
}
