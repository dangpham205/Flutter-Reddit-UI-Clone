import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/redditor.dart';

class RedditorCard extends StatelessWidget {
  final Redditor redditor;
  const RedditorCard({ Key? key, required this.redditor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage(redditor.avatarUrl),
                backgroundColor: seperateColor,
              ),
              Text("   u/" + redditor.name),
            ],
          ),
        ),
      ],
    );
  }
}