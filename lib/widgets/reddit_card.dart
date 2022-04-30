import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/reddit.dart';

class RedditCard extends StatelessWidget {
  final Reddit reddit;
  const RedditCard({ Key? key, required this.reddit }) : super(key: key);

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
            const Icon(Icons.star_border, color: textColor2,)
          ],
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}