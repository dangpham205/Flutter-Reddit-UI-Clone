import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/message.dart';
import '../../views/function_screens/message_detail_screen.dart';

class MessageCard extends StatelessWidget {
  
  final Message message;
  
  const MessageCard({ Key? key, required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessageDetailScreeen(message: message)));
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                Icon(Icons.mail, color: message.isRead == "false" ? darkblue : textColor2,),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(message.title)),
                          const Icon(Icons.more_vert)
                        ],
                      ),
                      const SizedBox(width: 6,),
                      Text(message.subtitle, style: const TextStyle(fontSize: 13, color: textColor2),),
                      const SizedBox(width: 6,),
                      Text(message.username,style: const TextStyle(fontSize: 13, color: redditColor),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 2,)
      ],
    );
  }
}