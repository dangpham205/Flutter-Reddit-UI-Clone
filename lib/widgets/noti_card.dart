import 'package:flutter/material.dart';
import '../models/notification.dart' as model;

import '../constants/colors.dart';

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
                  trailing: const Icon(Icons.more_vert),
                ),
                notification.isPost == "true"
                ? Center(
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