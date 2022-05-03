import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/comment.dart';

class CommentCard extends StatefulWidget {

  final Comment comment;

  const CommentCard({ Key? key, required this.comment }) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.comment.avatarUrl),
                  ),
                  const SizedBox(width: 8,),
                  Text(widget.comment.name, style: const TextStyle(color: textColor2, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 8,),
                  Text(widget.comment.time, style: const TextStyle(fontSize: 12,),)
                ],
              ),
              const SizedBox(height: 16,),
              Text(widget.comment.comment)
            ],
          ),
        ),
        Container(
          color: seperateColor,
          height: 6,
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}