

import 'package:river_sample/data_source/repo/activity_repo_impl.dart';
import 'package:river_sample/domain/repositories/activity_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo_providers.g.dart';

@Riverpod(keepAlive: true)
ActivityRepo activityRepoImpl(ActivityRepoImplRef ref) {
  return ActivityRepoImpl();
}