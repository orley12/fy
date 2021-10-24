import 'package:hive_flutter/adapters.dart';

part 'notification_view_model.g.dart';

@HiveType(typeId: 0)
class NotificationViewModel extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? message;

  @HiveField(2)
  String? date;

  NotificationViewModel([this.title = "", this.message = "", this.date = ""]);
}
