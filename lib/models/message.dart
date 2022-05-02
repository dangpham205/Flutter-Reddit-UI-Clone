import 'dart:convert';

import 'package:flutter/material.dart';

class Message{
  final String id;
  final String title;
  final String subtitle;
  final String username;
  final String isRead;

  const Message({
      required this.id,
      required this.title,
      required this.subtitle,
      required this.username,
      required this.isRead,
  });


  // //static method là method có thể gọi thẳng từ lớp mà kh cần tạo obj
  static Message fromJSON(dynamic snap) {
    return Message(    //chuyển thành object User và return
      id: snap['id'],
      title: snap['title'],
      subtitle: snap['subtitle'],
      username: snap['username'],
      isRead: snap['isRead'],
    );
  }

  static Future<List<Message>> getMessages(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/message.json");
    var tagObjsJson = jsonDecode(data)['message'] as List;
    List<Message> messages = tagObjsJson.map((tagJson) => Message.fromJSON(tagJson)).toList();
    return messages;
  }
    
}