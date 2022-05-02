import 'package:flutter/material.dart';
import 'package:midterm_519h0277/views/main_screens/tab_screens.dart/inbox_messages.dart';
import 'package:midterm_519h0277/views/main_screens/tab_screens.dart/inbox_notifications.dart';

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