import 'package:flutter/material.dart';
import '../../models/redditor.dart';
import '../../views/function_screens/chat_box_screen.dart';
import '../../views/function_screens/new_chat_screen.dart';

import '../../constants/colors.dart';
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
        body: Container(
          color: seperateColor,
          child: ListView(
            children: [
              FutureBuilder(
              future: Redditor.getRedditors(context),
              builder: (BuildContext context, AsyncSnapshot<List<Redditor>> redditor) {
              return MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: redditor.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var itemData = redditor.data![index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {(
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatBoxScreen(redditor: itemData))));
                              },
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                                  child: ListTile(
                                    leading: CircleAvatar(backgroundImage: AssetImage(itemData.avatarUrl), radius: 20,),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                itemData.name,
                                                style: const TextStyle(
                                                    color: textColor2,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700),
                                              )
                                            ),
                                            const Text('10:26 AM', style: TextStyle(fontSize: 13, color: textColor2),)
                                          ],
                                        ),
                                        const SizedBox(height: 4,),
                                        const Text('This is the last message in the convo', style: TextStyle(fontSize: 12),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(color: dividerColor, height: 1,)
                          ],
                        );
                      }
                    ),
                  ],
                ),
              );
              }
            ),
          ],
        ),
      ),
    );
  }
}