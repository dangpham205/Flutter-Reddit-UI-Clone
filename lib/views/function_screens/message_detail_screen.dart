import 'package:flutter/material.dart';
import 'package:midterm_519h0277/models/message.dart';

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
    );
  }
}