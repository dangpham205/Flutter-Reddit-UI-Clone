import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/redditor.dart';

class ChatBoxScreen extends StatefulWidget {

  final Redditor redditor;
  final bool? doublePop;
  const ChatBoxScreen({ Key? key, required this.redditor, this.doublePop }) : super(key: key);

  @override
  State<ChatBoxScreen> createState() => _ChatBoxScreenState();
}

class _ChatBoxScreenState extends State<ChatBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            if (widget.doublePop == true){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
            else{
              Navigator.of(context).pop();
            }
          },
          child: const Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text(widget.redditor.name, style: const TextStyle(color: Colors.black),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 36,),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(widget.redditor.avatarUrl),
            ),
            const SizedBox(height: 12,),
            Text(widget.redditor.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700,)),
            const SizedBox(height: 8,),
            Row(
              children: [
                Expanded(child: Container()),
                Text(widget.redditor.age, style: const TextStyle(fontSize: 12,color: textColor2),),
                const SizedBox(width: 8,),
                const Icon(Icons.circle, size: 8, color: textColor2,),
                const SizedBox(width: 8,),
                Text(widget.redditor.karma.toString()+ " karma", style: const TextStyle(fontSize: 12,color: textColor2),),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.camera_alt_outlined, color: textColor2,),
              const SizedBox(width: 16,),
              Expanded(
                child: Container(                //chat box
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(26.0),
                      top: Radius.circular(26.0)
                    ),
                    color: seperateColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Message ' + widget.redditor.name,
                            hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        )
                      ),
                      const Icon(Icons.gif_box, color: textColor2,),
                      const SizedBox(width: 8,),
                      const Icon(Icons.tag_faces_sharp, color: textColor2,),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              const Icon(Icons.send, color: textColor2,),
            ],
          ),
        ),
      ),
    );
  }
}