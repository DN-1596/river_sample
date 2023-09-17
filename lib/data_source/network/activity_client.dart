import 'package:dio/dio.dart';
import 'package:river_sample/data_source/isar_db/schemas/activity.dart';

class ActivityClient {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://www.boredapi.com/api',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      headers: {
        'Accept': 'application/json',
      },
    ),
  );

  Future<Activity> fetchActivity(String activityType) async {
    final response = await dio.get(
      "/activity",
      queryParameters: {
        'type': activityType,
      },
    );
    Activity activity = Activity.fromJson(response.data);
    return activity;
  }
}
