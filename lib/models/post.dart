import 'dart:convert';

import 'package:flutter/material.dart';

class Post{
  final String id;
  final String channel;
  final String avatarUrl;
  final String username;
  final String time;
  final String title;
  final String caption;
  final String imageUrl;
  final int upvotes;
  final int comments;
  final String isMember;
  final int awards;

  const Post( {
      required this.id,
      required this.channel,
      required this.avatarUrl,
      required this.username,
      required this.time,
      required this.title,
      required this.caption,
      required this.imageUrl,
      required this.upvotes,
      required this.comments,
      required this.isMember,
      required this.awards,
  });


  // //static method là method có thể gọi thẳng từ lớp mà kh cần tạo obj
  static Post fromJSON(dynamic snap) {
    return Post(    //chuyển thành object User và return
      id: snap['id'],
      channel: snap['channel'],
      avatarUrl: snap['avatarUrl'],
      username: snap['username'],
      time: snap['time'],
      title: snap['title'],
      caption: snap['caption'],
      imageUrl: snap['imageUrl'],
      upvotes: snap['upvotes'],
      comments: snap['comments'],
      isMember: snap['isMember'],
      awards: snap['awards'],
    );
  }
    
  static Future<List<Post>> getPosts(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/post.json");
    var tagObjsJson = jsonDecode(data)['post'] as List;
    List<Post> posts = tagObjsJson.map((tagJson) => Post.fromJSON(tagJson)).toList();
    return posts;
  }

  static Future<List<Post>> getPostsWithImage(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/post.json");
    var tagObjsJson = jsonDecode(data)['post'] as List;
    List<Post> posts = tagObjsJson.map((tagJson) => Post.fromJSON(tagJson)).toList();
    List<Post> result = [];
    for (Post post in posts){
      if (post.imageUrl != ""){
        result.add(post);
      }
    }
    return result;
  }
}