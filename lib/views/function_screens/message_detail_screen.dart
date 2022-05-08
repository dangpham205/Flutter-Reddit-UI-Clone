import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/message.dart';

class MessageDetailScreeen extends StatefulWidget {

  final Message message;

  const MessageDetailScreeen({ Key? key, required this.message }) : super(key: key);

  @override
  State<MessageDetailScreeen> createState() => _MessageDetailScreeenState();
}

class _MessageDetailScreeenState extends State<MessageDetailScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(widget.message.username, style: const TextStyle(color: Colors.black),),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Expanded(
            child: Container(                //chat box
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.0),
                  top: Radius.circular(12.0)
                ),
                color: seperateColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Replying to message',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: seperateColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.message.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16,),
                  const Divider(color: dividerColor,),
                  Text(widget.message.username, style: const TextStyle(color: redditColor),),
                  const SizedBox(height: 4,),
                  Text(widget.message.subtitle)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}