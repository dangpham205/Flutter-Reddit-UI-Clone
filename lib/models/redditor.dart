import 'dart:convert';

import 'package:flutter/material.dart';

class Redditor{
  final String id;
  final String name;
  final String avatarUrl;
  final String backgroundUrl;
  final String bio;
  final int followers;
  final int karma;
  final String age;

  const Redditor({
      required this.id,
      required this.name,
      required this.avatarUrl,
      required this.backgroundUrl,
      required this.bio,
      required this.followers,
      required this.karma,
      required this.age,
  });


  // //static method là method có thể gọi thẳng từ lớp mà kh cần tạo obj
  static Redditor fromJSON(dynamic snap) {
    return Redditor(    //chuyển thành object User và return
      id: snap['id'],
      name: snap['name'],
      avatarUrl: snap['avatarUrl'],
      backgroundUrl: snap['backgroundUrl'],
      bio: snap['bio'],
      followers: snap['followers'],
      karma: snap['karma'],
      age: snap['age'],
    );
  }

  static Future<List<Redditor>> getRedditors(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/redditor.json");
    var tagObjsJson = jsonDecode(data)['redditor'] as List;
    List<Redditor> redditors = tagObjsJson.map((tagJson) => Redditor.fromJSON(tagJson)).toList();
    return redditors;
  }
    
}