import 'package:chat_app/core/constant/title/titles.dart';
import 'package:chat_app/core/helper/hive/hive_helper.dart';
import 'package:chat_app/core/model/message_model.dart';
import 'package:chat_app/core/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messages_states.dart';

class MessagesCubit extends Cubit<MessagesState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  MessagesCubit() : super(MessagesCubitInitial()) {
    loadMessagesFromHive();
    listenToMessages();
  }

  void loadMessagesFromHive() {
    final messages = HiveHelper.getMessages();
    emit(MessagesLoaded(messages));
  }

  Future<void> sendMessage({
    required String content,
    required UserModel sender,
  }) async {
    final message = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      sender: sender,
      content: content,
      timestamp: DateTime.now(),
    );

    try {
      // Add the message to Firestore
      await _firestore.collection(Titles.messages).add(message.toJson());

      // Save the message in Hive
      await HiveHelper.saveMessage(message);

      // Do not emit the updated messages list here
      // The listener will handle emitting the complete messages list
    } catch (e) {
      emit(MessagesError('فشل أرسال الرسالة'));
    }
  }

  void listenToMessages() {
    _firestore
        .collection(Titles.messages)
        .orderBy('timestamp')
        .snapshots()
        .listen(
      (snapshot) {
        List<MessageModel> messages = snapshot.docs.map((doc) {
          // Ensure you are correctly converting each document into MessageModel
          return MessageModel.fromJson(doc.data());
        }).toList();

        // Clear existing messages in Hive
        HiveHelper.clearMessages();

        // Save the new messages in Hive
        for (var message in messages) {
          HiveHelper.saveMessage(message);
        }

        // Emit the new list of messages
        emit(MessagesLoaded(messages));
      },
      onError: (error) {
        emit(MessagesError('فشل تحميل الرسائل'));
      },
    );
  }

  Future<void> deleteMessage(MessageModel message) async {
    try {
      // Remove the message from Firestore
      final querySnapshot = await _firestore
          .collection(Titles.messages)
          .where('id', isEqualTo: message.id)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      // Remove the message from Hive
      await HiveHelper.removeMessageById(message.id);

      // Synchronize with Firestore immediately
      final snapshot = await _firestore
          .collection(Titles.messages)
          .orderBy('timestamp')
          .get();

      List<MessageModel> messages = snapshot.docs.map((doc) {
        return MessageModel.fromJson(doc.data());
      }).toList();

      // Clear and update Hive with the latest messages
      HiveHelper.clearMessages();
      for (var message in messages) {
        HiveHelper.saveMessage(message);
      }

      // Emit the updated messages list
      emit(MessagesLoaded(messages));
    } catch (e) {
      emit(MessagesError('فشل حذف الرسالة'));
    }
  }
}
