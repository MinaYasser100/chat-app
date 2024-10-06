import 'package:chat_app/core/model/user_model.dart';
import 'package:hive/hive.dart';
part 'message_model.g.dart';

@HiveType(typeId: 1)
class MessageModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final UserModel sender;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final DateTime timestamp;
  @HiveField(4)
  final bool isRead;

  MessageModel({
    required this.id,
    required this.sender,
    required this.content,
    required this.timestamp,
    this.isRead = false,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      sender: UserModel.formJson(json['sender']),
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? false,
    );
  }

  // Method to convert a MessageModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }
}
