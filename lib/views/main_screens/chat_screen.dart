import 'package:flutter/material.dart';
import 'package:midterm_519h0277/views/function_screens/new_chat_screen.dart';

import '../../widgets/end_drawer.dart';
import '../../widgets/start_drawer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({ Key? key }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const StartDrawer(),
        endDrawer: const EndDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("Chats", style: TextStyle(color: Colors.black),),
          actions: [
            InkWell(
              child: const Icon(Icons.chat_bubble_outline),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewChatScreen()));
              },
            ),
            const SizedBox(width: 4,),
            Builder(
              builder: (context) => TextButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();   //openenddrawer
                }, 
                child: const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/image/reddit_avatar.png'),
                ),
              ),
            ),
          ],
        ),
    );
  }
}