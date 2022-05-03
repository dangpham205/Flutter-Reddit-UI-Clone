import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({ Key? key }) : super(key: key);

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: seperateColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.tag_faces_sharp, color: textColor2, size: 60,),
          SizedBox(height: 8,),
          Text('Wow, such empty', style: TextStyle(color: textColor2),)
        ],
      ),
    );
  }
}