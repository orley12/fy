import 'package:hive_flutter/adapters.dart';

part 'notification_view_model.g.dart';

@HiveType(typeId: 0)
class NotificationViewModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? message;

  @HiveField(3)
  String? date;

  NotificationViewModel([this.id = "", this.title = "", this.message = "", this.date = ""]);
}
