import 'package:hive/hive.dart';
part 'notification_model.g.dart';

@HiveType(typeId: 40)
class NotificationModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? body;
  @HiveField(2)
  String? receivedAt;
  @HiveField(3)
  bool? readed;
  @HiveField(4)
  String? key;
  NotificationModel(
      {this.title, this.body, this.receivedAt, this.readed, this.key});
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json['title'] as String?,
        body: json['body'] as String?,
        receivedAt: json['receivedAt'] as String?,
        readed: json['readed'] as bool?,
        key: json['key'] as String?,
      );
  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'receivedAt': receivedAt,
        'readed': readed,
        'key': key,
      };
}
