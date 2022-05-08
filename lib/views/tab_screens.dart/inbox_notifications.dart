import 'package:flutter/material.dart';
import '../../widgets/noti_card.dart';

import '../../../constants/colors.dart';
import '../../models/notification.dart' as model;

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({ Key? key }) : super(key: key);

  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: seperateColor,
        child: ListView(
          children: [
            FutureBuilder(
            future: model.Notification.getNotifications(context),
            builder: (BuildContext context, AsyncSnapshot<List<model.Notification>> notification) {
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text('Today', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: notification.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var itemData = notification.data![index];
                      if (itemData.time == "today"){
                        return NotificationCard(notification: itemData);
                      }
                      return const SizedBox.shrink();
                    }
                  ),
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text('Earlier', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: notification.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var itemData = notification.data![index];
                      if (itemData.time == "this week"){
                        return NotificationCard(notification: itemData);
                      }
                      return const SizedBox.shrink();
                    }
                  ),
                  Container(
                    color: Colors.white,
                    child: const ListTile(
                      title: Text('All', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: notification.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var itemData = notification.data![index];
                      if (itemData.time == "other"){
                        return NotificationCard(notification: itemData);
                      }
                      return const SizedBox.shrink();
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