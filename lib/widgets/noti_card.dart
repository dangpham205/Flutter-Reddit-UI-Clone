import 'package:flutter/material.dart';
import 'package:midterm_519h0277/models/post.dart';
import '../constants/custom_icons.dart';
import '../models/notification.dart' as model;

import '../constants/colors.dart';
import '../views/function_screens/post_detail_screen.dart';
import 'dialog_option_without_tick.dart';

class NotificationCard extends StatelessWidget {

  final model.Notification notification;

  const NotificationCard({ Key? key, required this.notification }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: MediaQuery.of(context).size.width,
          color: notiColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom:8),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(notification.avatarUrl),
                  ),
                  title: Text(notification.title, style: const TextStyle(fontSize: 14)),
                  subtitle: Text(notification.subtitle, style: const TextStyle(fontSize: 13, color: textColor2),),
                  trailing: Material(
                    color: notiColor,
                    child: InkWell(
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
                                  top: Radius.circular(26.0)
                                ),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 8,),
                                  const Text('Manage Notification', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 8,),
                                  const Divider(color: dividerColor,),
                                  const DialogOption2(icon: Icons.remove_red_eye, text: 'Hide this notification'),
                                  const DialogOption2(icon: CustomIcon.block, text: 'Disable updates from this community'),
                                  const DialogOption2(icon: Icons.notifications, text: 'Turn off this notification type'),
                                  const SizedBox(height: 8,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(26.0),
                                          top: Radius.circular(26.0)
                                        ),
                                        color:  bg2,
                                      ),
                                        child: const Center(
                                          child: Text(
                                            'CLOSE',
                                            style: TextStyle(
                                              color: Colors.black, 
                                              fontWeight: FontWeight.bold
                                            ),
                                        )
                                      )
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                ],
                              ),
                            ),
                          ) 
                        );
                      },
                      child: const Icon(Icons.more_vert, size: 28,)
                    ),
                  ),
                ),
                notification.isPost == "true"
                ? Material(
                  color: notiColor,
                  child: InkWell(
                    onTap: () {
                      Post post = const Post(
                          id: "1",
                          channel: "randomchannelname",
                          avatarUrl: "assets/image/logo1.png",
                          username: "developer-27",
                          time: "16h",
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                          caption: "Lorem Ipsum has been the industry's",
                          imageUrl: "",
                          upvotes: 500,
                          comments: 46,
                          isMember: "true",
                          awards: 1);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetailScreen(post: post)));
                    },
                    child: Center(
                      child: Container(        
                        width: MediaQuery.of(context).size.width*0.7,
                        padding: const EdgeInsets.symmetric(vertical: 8,),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: darkblue,
                            // width: 5,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(26.0),
                            top: Radius.circular(26.0)
                          ),
                          color: notiColor,
                        ),
                        child: const Center(child: Text("See Post", style: TextStyle(fontWeight: FontWeight.bold, color: darkblue),)),
                      )
                    ),
                  ),
                )
                : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 2,)
      ],
    );
  }
}