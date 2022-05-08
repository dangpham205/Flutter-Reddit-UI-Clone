import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/reddit.dart';

class RedditCard extends StatelessWidget {
  final Reddit reddit;
  final bool withJoinButton;
  const RedditCard({ Key? key, required this.reddit, required this.withJoinButton }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(reddit.avatarUrl),
              backgroundColor: seperateColor,
            ),
            Text("   r/" + reddit.name),
            Expanded(child: Container()),
            withJoinButton ?
            Container(            //start direct chat o dau screen
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(26.0),
                  top: Radius.circular(26.0)
                ),
                color: redditColor,
              ),
              child: const Text('Join', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12),),
            )
            :  const Icon(Icons.star_border, color: textColor2,)
          ],
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}