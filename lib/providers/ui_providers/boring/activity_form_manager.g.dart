// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_form_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchNewActivityListHash() =>
    r'9c4f17493a6db2a6b2912e8a7b97ad66b2a0eb52';

/// See also [FetchNewActivityList].
@ProviderFor(FetchNewActivityList)
final fetchNewActivityListProvider = AutoDisposeAsyncNotifierProvider<
    FetchNewActivityList, List<ActivityEntity>>.internal(
  FetchNewActivityList.new,
  name: r'fetchNewActivityListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchNewActivityListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchNewActivityList = AutoDisposeAsyncNotifier<List<ActivityEntity>>;
String _$selectActivityTypeHash() =>
    r'e7f9cec9ca7a07786e651b753e0db53dfc47b245';

/// See also [SelectActivityType].
@ProviderFor(SelectActivityType)
final selectActivityTypeProvider =
    AutoDisposeNotifierProvider<SelectActivityType, ActivityType?>.internal(
  SelectActivityType.new,
  name: r'selectActivityTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectActivityTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectActivityType = AutoDisposeNotifier<ActivityType?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
