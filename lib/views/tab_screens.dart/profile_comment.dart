import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CommentsTab extends StatefulWidget {
  const CommentsTab({ Key? key }) : super(key: key);

  @override
  State<CommentsTab> createState() => _CommentsTabState();
}

class _CommentsTabState extends State<CommentsTab> {
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