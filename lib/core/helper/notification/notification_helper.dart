import 'package:dio/dio.dart';
import 'get_access_token.dart';

class NotificationHelper {
  final String notificationPublicTopic = 'notificationPublicTopic';
  final Dio _dio = Dio();
  Future<bool> sendNotification({
    required String title,
    required String body,
    String? imageUrl,
  }) async {
    try {
      final String? serverToken = await getAccessToken();
      await _dio.post(
        'https://fcm.googleapis.com/v1/projects/chat-app-be77b/messages:send',
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $serverToken',
          },
        ),
        data: {
          "message": {
            "topic": notificationPublicTopic,
            "notification": {"title": title, "body": body},
            "image": imageUrl,
            "android": {
              "notification": {
                "notification_priority": "PRIORITY_MAX",
                "sound": "default"
              }
            },
            "apns": {
              "payload": {
                "aps": {
                  "content_available": true,
                }
              },
            },
            "data": {
              "type": "type",
              "id": "userId",
              "click_action": "FLUTTER_NOTIFICATION_CLICK"
            }
          }
        },
      );
      return true;
    } on DioException {
      return false;
    }
  }
}
