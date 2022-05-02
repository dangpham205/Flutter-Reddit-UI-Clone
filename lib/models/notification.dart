import 'dart:convert';

import 'package:flutter/material.dart';

class Notification{
  final String id;
  final String title;
  final String subtitle;
  final String avatarUrl;
  final String time;
  final String isPost;

  const Notification({
      required this.id,
      required this.title,
      required this.subtitle,
      required this.avatarUrl,
      required this.time,
      required this.isPost,
  });


  // //static method là method có thể gọi thẳng từ lớp mà kh cần tạo obj
  static Notification fromJSON(dynamic snap) {
    return Notification(    //chuyển thành object User và return
      id: snap['id'],
      title: snap['title'],
      subtitle: snap['subtitle'],
      avatarUrl: snap['avatarUrl'],
      time: snap['time'],
      isPost: snap['isPost'],
    );
  }

  static Future<List<Notification>> getNotifications(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/notification.json");
    var tagObjsJson = jsonDecode(data)['notification'] as List;
    List<Notification> notifications = tagObjsJson.map((tagJson) => Notification.fromJSON(tagJson)).toList();
    return notifications;
  }
    
}