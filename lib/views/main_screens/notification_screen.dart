import 'package:flutter/material.dart';
import 'package:midterm_519h0277/views/function_screens/new_msg_screen.dart';
import '../../constants/custom_icons.dart';
import '../../views/tab_screens.dart/inbox_messages.dart';
import '../../views/tab_screens.dart/inbox_notifications.dart';
import '../../widgets/dialog_option_without_tick.dart';

import '../../widgets/end_drawer.dart';
import '../../widgets/start_drawer.dart';
import '../function_screens/settings_screen.dart';

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
                  showGeneralDialog(
                      context: context, 
                      transitionDuration: const Duration(milliseconds: 320),
                      barrierDismissible: true,
                      barrierLabel: "Barrier",
                      barrierColor: Colors.black.withOpacity(0.6),
                      transitionBuilder: (_, anim, __, child) {
                        Tween<Offset> tween;
                        if (anim.status == AnimationStatus.reverse) {
                          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
                        } else {
                          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
                        }
                        return SlideTransition(
                          position: tween.animate(anim),
                          child: FadeTransition(
                            opacity: anim,
                            child: child,
                          ),
                        );
                      },
                      pageBuilder: (_,__,___) => Dialog(
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
                          children: [
                            Material(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewMsgScreen()));
                                },
                                child:const  DialogOption2(icon: CustomIcon.colorize, text: 'New message')
                              ),
                            ),
                            const DialogOption2(icon: Icons.mark_chat_read_outlined, text: 'Mark all inbox tabs as read'),
                            Material(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
                                },
                                child: const DialogOption2(icon: Icons.settings, text: 'Edit notification settings')
                              ),
                            ),
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