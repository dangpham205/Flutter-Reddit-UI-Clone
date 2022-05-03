import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm_519h0277/models/post.dart';
import 'package:midterm_519h0277/models/reddit.dart';
import 'package:midterm_519h0277/views/function_screens/channel_screen.dart';

import '../constants/colors.dart';
import '../models/redditor.dart';
import '../views/function_screens/profile_screen.dart';

class PostCard extends StatefulWidget {
  
  final Post post;

  const PostCard({ Key? key, required this.post }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  
  late Redditor redditor;
  late Reddit reddit;

  void getRedditor1(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/redditor.json");
    var tagObjsJson = jsonDecode(data)['redditor'] as List;
    List<Redditor> redditors = tagObjsJson.map((tagJson) => Redditor.fromJSON(tagJson)).toList();
    for (Redditor r in redditors){
      if (r.name == widget.post.username){
        redditor = r;
      }
    }
  }

  void getReddits(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/reddit.json");
    var tagObjsJson = jsonDecode(data)['reddit'] as List;
    List<Reddit> reddits = tagObjsJson.map((tagJson) => Reddit.fromJSON(tagJson)).toList();
    for (Reddit r in reddits){
      if (r.name == widget.post.channel){
        reddit = r;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getRedditor1(context);
    getReddits(context);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(    //row contain channel avt, channel name, username, post time, join button
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(widget.post.avatarUrl),
                    backgroundColor: seperateColor,
                  ),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 100)).then((value) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChannelScreen(reddit: reddit)));
                          });
                        },
                        child: Text("r/"+widget.post.channel, style: const TextStyle(fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 6,),
                      InkWell(
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 100)).then((value) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(redditor: redditor)));
                          });
                        },
                        child: Row(
                          children: [
                            Text("u/"+widget.post.username + " ", style: const TextStyle(color: textColor2, fontSize: 12),),
                            const Icon(Icons.circle, color: textColor2,size: 4,),
                            Text(" " + widget.post.time, style: const TextStyle(color: textColor2, fontSize: 12))
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  widget.post.isMember == "true" 
                  ? Container()
                  : Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(26.0),
                        top: Radius.circular(26.0)
                      ),
                      color: darkblue,
                    ),
                    child: const Text('Join', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  const Icon(Icons.more_vert, color: textColor2,size: 20,)
                ],
              ),
              widget.post.awards == 0          //award cua~ post
              ? Container()
              : widget.post.awards == 1
              ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/image/aw1.jpg'),
                    ),
                    SizedBox(width: 4,),
                    Text('1 Award', style: TextStyle(color: textColor2, fontSize: 12),)
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/image/aw2.jpg'),
                    ),
                    SizedBox(width: 4,),
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/image/aw3.jpg'),
                    ),
                    SizedBox(width: 4,),
                    Text('2 Awards', style: TextStyle(color: textColor2, fontSize: 12),)
                  ],
                ),
              ),
              Padding(                                //title
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(widget.post.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              widget.post.caption != "" 
              ? Text(widget.post.caption, style: const TextStyle(color: textColor2,fontSize: 12),)
              : widget.post.imageUrl != ""
              ? Image(
                image: AssetImage(widget.post.imageUrl),
                fit: BoxFit.fitWidth,
              )
              : Container(),
              Padding(                                      //bottom cua post card
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Row(
                            children: [
                              const Icon(Icons.arrow_circle_up, color: textColor2,),
                              const SizedBox(width: 8,),
                              Text(widget.post.upvotes.toString(), style: const TextStyle(color: textColor2, fontWeight: FontWeight.w600),),
                              const SizedBox(width: 8,),
                              const Icon(Icons.arrow_circle_down, color: textColor2,),

                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              const SizedBox(width: 8,),
                              const Icon(Icons.chat_bubble_outline, color: textColor2,),
                              const SizedBox(width: 8,),
                              Text(widget.post.comments.toString(), style: const TextStyle(color: textColor2, fontWeight: FontWeight.w600),)
                            ],
                          )),
                        ],
                      )
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: const [
                                Icon(Icons.share_outlined, color: textColor2,),
                                SizedBox(width: 8,),
                                Text('Share', style: TextStyle(color: textColor2, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          const Icon(Icons.card_giftcard_outlined, color: textColor2,),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Container(color: seperateColor, height: 8,)
      ]
    );
  }
}