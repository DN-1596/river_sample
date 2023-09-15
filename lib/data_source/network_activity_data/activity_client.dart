




import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:river_sample/data_source/isar_db/schemas/activity.dart';




class ActivityClient {
  final dio = Dio();

  Future<Activity> fetchActivity(String activityType) async {
    final response = await dio.get("https://www.boredapi.com/api/activity?type=recreational");
    Map<String,dynamic> json = jsonDecode(response.data.toString());
    return Activity.fromJson(json);
  }


}