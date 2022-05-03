import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/comment.dart';
import 'package:midterm_519h0277/models/post.dart';
import 'package:midterm_519h0277/views/function_screens/channel_screen.dart';
import 'package:midterm_519h0277/views/function_screens/profile_screen.dart';
import 'package:midterm_519h0277/widgets/end_drawer.dart';

import '../../models/reddit.dart';
import '../../models/redditor.dart';
import '../../widgets/comment_card.dart';

class PostDetailScreen extends StatefulWidget {

  final Post post;

  const PostDetailScreen({ Key? key, required this.post }) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {

  late Redditor redditor;
  late Reddit reddit;

  void getRedditor(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/redditor.json");
    var tagObjsJson = jsonDecode(data)['redditor'] as List;
    List<Redditor> redditors = tagObjsJson.map((tagJson) => Redditor.fromJSON(tagJson)).toList();
    for (Redditor r in redditors){
      if (r.name == widget.post.username){
        redditor = r;
      }
    }
  }

  void getReddit(BuildContext context) async{
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
    getRedditor(context);
    getReddit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const EndDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: Text(widget.post.channel),
        actions: [
            InkWell(
              child: const Icon(Icons.notifications_outlined, color: Colors.white,),
              onTap: () {
              },
            ),
            const SizedBox(width: 8,),
            InkWell(
              child: const Icon(Icons.more_vert, color: Colors.white,),
              onTap: () {
              },
            ),
            const SizedBox(width: 4,),
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
        ),
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(    //row contain channel avt, channel name, username, post time, join button
                      children: [
                        CircleAvatar(
                          radius: 26,
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
                              child: Text("r/"+widget.post.channel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                            const SizedBox(height: 6,),
                            InkWell(
                              onTap: () {
                                Future.delayed(const Duration(milliseconds: 100)).then((value) {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(redditor: redditor)));
                                });
                              },
                              child: Row(
                                children: [
                                  Text("u/"+widget.post.username + " ", style: const TextStyle(color: textColor2, fontSize: 14),),
                                  const Icon(Icons.circle, color: textColor2,size: 4,),
                                  Text(" " + widget.post.time, style: const TextStyle(color: textColor2, fontSize: 12))
                                ],
                              ),
                            )
                          ],
                        ),
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
                            radius: 12,
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
                            radius: 12,
                            backgroundImage: AssetImage('assets/image/aw2.jpg'),
                          ),
                          SizedBox(width: 4,),
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage('assets/image/aw3.jpg'),
                          ),
                          SizedBox(width: 4,),
                          Text('2 Awards', style: TextStyle(color: textColor2, fontSize: 12),)
                        ],
                      ),
                    ),
                    Padding(                                //title
                      padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                      child: Text(widget.post.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                    widget.post.caption != "" 
                    ? Text(widget.post.caption, style: const TextStyle(color: textColor2,fontSize: 14),)
                    : widget.post.imageUrl != ""
                    ? Image(
                      image: AssetImage(widget.post.imageUrl),
                      fit: BoxFit.fitWidth,
                    )
                    : Container(),
                    Padding(                                      //bottom cua post card
                      padding: const EdgeInsets.only(top: 12.0),
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
              Container(
                width: MediaQuery.of(context).size.width,
                color: seperateColor,
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  width: 140,
                  height: 50,
                  child: Row(
                    children: const [
                      Icon(Icons.rocket, color: textColor2,),
                      Text('BEST COMMENTS', style: TextStyle(color: textColor2, fontSize: 12, fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_drop_down_outlined, color: textColor2,)
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    FutureBuilder(
                      future: Comment.getComments(context),
                      builder: (BuildContext context, AsyncSnapshot<List<Comment>> comment) {
                      return MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: comment.data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            var itemData = comment.data![index];
                            return CommentCard(comment: itemData);
                          }
                        ),
                      );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}