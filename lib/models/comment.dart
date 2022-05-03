import 'dart:convert';

import 'package:flutter/material.dart';

class Comment{
  final String id;
  final String name;
  final String avatarUrl;
  final String time;
  final String comment;
  final int upvotes;

  const Comment({
      required this.id,
      required this.name,
      required this.avatarUrl,
      required this.time,
      required this.comment,
      required this.upvotes,
  });


  // //static method là method có thể gọi thẳng từ lớp mà kh cần tạo obj
  static Comment fromJSON(dynamic snap) {
    return Comment(    //chuyển thành object User và return
      id: snap['id'],
      name: snap['name'],
      avatarUrl: snap['avatarUrl'],
      time: snap['time'],
      comment: snap['comment'],
      upvotes: snap['upvotes'],
    );
  }

  static Future<List<Comment>> getComments(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/comment.json");
    var tagObjsJson = jsonDecode(data)['comment'] as List;
    List<Comment> comments = tagObjsJson.map((tagJson) => Comment.fromJSON(tagJson)).toList();
    return comments;
  }
    
}