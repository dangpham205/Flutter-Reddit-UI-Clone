import 'package:flutter/material.dart';
import 'package:midterm_519h0277/views/tab_screens.dart/inbox_messages.dart';
import 'package:midterm_519h0277/views/tab_screens.dart/inbox_notifications.dart';
import 'package:midterm_519h0277/widgets/dialog_option_without_tick.dart';

import '../../widgets/end_drawer.dart';
import '../../widgets/start_drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({ Key? key }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: const StartDrawer(),
          endDrawer: const EndDrawer(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text("Inbox", style: TextStyle(color: Colors.black),),
            actions: [
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.more_vert),
                ),
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (context) => Dialog(
                      alignment: Alignment.bottomCenter,
                      // insetPadding: EdgeInsets.only(top: 100),
                      insetPadding: EdgeInsets.zero,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12.0),
                            top: Radius.circular(12.0)
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            DialogOption2(icon: Icons.carpenter_outlined, text: 'New message'),
                            DialogOption2(icon: Icons.mark_chat_read_outlined, text: 'Mark all inbox tabs as read'),
                            DialogOption2(icon: Icons.settings, text: 'Edit notification settings'),
                          ],
                        ),
                      ),
                    ) 
                  );
                },
              ),
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
            bottom: TabBar(
              tabs: [
                const Tab(
                  child: Text('Notifications', style: TextStyle(color: Colors.black),),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Messages', style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(26.0),
                              top: Radius.circular(26.0)
                            ),
                            color: Colors.red,
                          ),
                          child: const Text('3'),
                        ),
                      )
                    ],
                  ),
                ),              
              ],
            ),
          ),
          body: const TabBarView(
          children: [
            NotificationsTab(),
            MessagesTab()
          ]
        ),
      ),
    );
  }
}