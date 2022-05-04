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
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
          height: 1.5,
          color: seperateColor,
        ),
        Container(
          color: Colors.white,                                      //bottom cua post card
          padding: const EdgeInsets.only(top: 8.0, left: 12, right: 12, bottom: 8),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.more_vert, color: textColor2,),
                    SizedBox(width: 12,),
                    Icon(Icons.card_giftcard_outlined, color: textColor2,),
                    SizedBox(width: 12,),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 8,),
                        Icon(Icons.turn_left, color: textColor2,),
                        SizedBox(width: 8,),
                        Text('Reply', style: TextStyle(color: textColor2, fontWeight: FontWeight.w600),)
                      ],
                    ),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.arrow_circle_up, color: textColor2,),
                        const SizedBox(width: 8,),
                        Text(widget.comment.upvotes.toString(), style: const TextStyle(color: textColor2, fontWeight: FontWeight.w600),),
                        const SizedBox(width: 8,),
                        const Icon(Icons.arrow_circle_down, color: textColor2,),

                      ],
                    )),
                    
                  ],
                )
              ),
              
            ],
          ),
        ),
        Container(      //seperate giua cac post
          color: seperateColor,
          height: 12,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}