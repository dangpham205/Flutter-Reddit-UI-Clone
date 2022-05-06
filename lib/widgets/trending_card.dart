import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/views/function_screens/post_detail_screen.dart';

import '../models/post.dart';

class TrendingCard extends StatefulWidget {
  
  final Post post;
  const TrendingCard({ Key? key, required this.post }) : super(key: key);

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetailScreen(post: widget.post)));
        
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: seperateColor,
              width: 2
            ),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.local_fire_department_outlined, color: darkblue,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.post.title.length > 20 && widget.post.imageUrl != "" 
                    ? Text(widget.post.title.substring(0,21)+"...", style: const TextStyle(color: darkblue, fontSize: 16),)
                    : widget.post.title.length > 20 && widget.post.imageUrl == "" 
                    ? Text(widget.post.title+"...", style: const TextStyle(color: darkblue, fontSize: 16),)
                    : Text(widget.post.title, style: const TextStyle(color: darkblue, fontSize: 16),),
                    const SizedBox(height: 8,),
                    Text("u/"+widget.post.username, style: const TextStyle(color: textColor2, fontSize: 12),),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(widget.post.avatarUrl),
                        ),
                        Text("  r/"+widget.post.channel, style: const TextStyle(color: textColor2, fontSize: 12),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            widget.post.imageUrl != "" 
            ? SizedBox(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage(widget.post.imageUrl),
                  fit: BoxFit.cover,
                ),
              )
            : Container()
          ],
        ),
      ),
    );
  }
}