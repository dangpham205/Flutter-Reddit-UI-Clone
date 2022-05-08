import 'package:flutter/material.dart';
import '../../models/message.dart';
import '../../widgets/message_card.dart';

import '../../../constants/colors.dart';

class MessagesTab extends StatefulWidget {
  const MessagesTab({ Key? key }) : super(key: key);

  @override
  State<MessagesTab> createState() => MessagesStateTab();
}

class MessagesStateTab extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: seperateColor,
        child: ListView(
          children: [
            FutureBuilder(
            future: Message.getMessages(context),
            builder: (BuildContext context, AsyncSnapshot<List<Message>> message) {
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Column(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: message.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var itemData = message.data![index];
                      return MessageCard(
                        message: itemData,
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