
class ActivityEntity {
  String activityName;
  ActivityType activityType;
  int id;


  ActivityEntity({
    required this.activityType,
    required this.activityName,
    required this.id,
  });
}

enum ActivityType {
  education("education"),
  recreational("recreational"),
  social("social"),
  diy("diy"),
  charity("charity"),
  cooking("cooking"),
  relaxation("relaxation"),
  music("music"),
  busywork("busywork");


  final String name;
  const ActivityType(this.name);

  static ActivityType getActivityType(String type) {
    switch(type) {
      case "recreational" :
        return ActivityType.recreational;
      case "social" :
        return ActivityType.recreational;
      case "diy" :
        return ActivityType.recreational;
      case "charity" :
        return ActivityType.recreational;
      case "cooking" :
        return ActivityType.recreational;
      case "relaxation" :
        return ActivityType.recreational;
      case "music" :
        return ActivityType.recreational;
      case "busywork" :
        return ActivityType.recreational;
      default :
        return ActivityType.recreational;
    }
  }
}
