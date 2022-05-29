import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/utils.dart';
import '../../constants/colors.dart';
import '../../models/comment.dart';
import '../../models/post.dart';
import '../../views/function_screens/channel_screen.dart';
import '../../views/function_screens/profile_screen.dart';
import '../../widgets/end_drawer.dart';

import '../../constants/custom_icons.dart';
import '../../models/reddit.dart';
import '../../models/redditor.dart';
import '../../widgets/comment_card.dart';
import '../../widgets/dialog_option.dart';

class PostDetailScreen extends StatefulWidget {

  final Post post;

  const PostDetailScreen({ Key? key, required this.post }) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {

  late Redditor redditor;
  late Reddit reddit;
  bool isVoted = false;
  bool NotiOn = false;

  void changeColor() {
    if (isVoted == true ){
      setState(() {
        isVoted = false;
      });
    }
    else{
      setState(() {
        isVoted = true;
      });
    }
  }

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
              child: Icon(
                NotiOn
                ? Icons.notifications 
                : Icons.notifications_outlined, 
                color: Colors.white,),
              onTap: () {
                setState(() {
                  if (NotiOn){
                    NotiOn = false;
                    showSnackBar(context, "Post unsubribed!", snack2);
                  }
                  else{
                    NotiOn = true;
                    showSnackBar(context, "Post subribed!", snack1);
                  }
                });
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
        bottomSheet: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: dividerColor,
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(            // online users phía trên khung chat
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.loose,
                      children: const [
                        Positioned(
                          left: 15,
                          // right: -5,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundImage: AssetImage('assets/image/reddit_figure.png'),
                          ),
                        ),
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage('assets/image/reddit_avatar.png'),
                        ),
                      ],
                    ),
                  ),
                  const Text('2 people are here', style: TextStyle(fontSize: 12, color: textColor2),)
                ],
              ),
              const SizedBox(height: 6,),
              Container(                                       //chat box
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.0),
                    top: Radius.circular(12.0)
                  ),
                  color: seperateColor,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children:const [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add a comment',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      )
                    ),
                    SizedBox(width: 16,),
                    Icon(Icons.send, color: textColor2,),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: seperateColor,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              
              FutureBuilder(
                future: Comment.getComments(context),
                builder: (BuildContext context, AsyncSnapshot<List<Comment>> comment) {
                return MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Column(
                    children: [
                      Container(            //container dau screen
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
                                    Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {
                                          Future.delayed(const Duration(milliseconds: 100)).then((value) {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChannelScreen(reddit: reddit)));
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                                          child: Text("r/"+widget.post.channel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                        )),
                                    ),
                                    // const SizedBox(height: 6,),
                                    Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {
                                          Future.delayed(const Duration(milliseconds: 100)).then((value) {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(redditor: redditor)));
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                                          child: Row(
                                            children: [
                                              Text("u/"+widget.post.username + " ", style: const TextStyle(color: textColor2, fontSize: 14),),
                                              const Icon(Icons.circle, color: textColor2,size: 4,),
                                              Text(" " + widget.post.time, style: const TextStyle(color: textColor2, fontSize: 12))
                                            ],
                                          ),
                                        ),
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
                            Hero(
                              tag: {widget.post.title},
                              child: Padding(                                //title
                                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                                child: Text(widget.post.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              ),
                            ),
                            widget.post.caption != "" 
                            ? Hero(tag: {widget.post.caption},child: Text(widget.post.caption, style: const TextStyle(color: textColor2,fontSize: 14),))
                            : widget.post.imageUrl != ""
                            ? Hero(
                              tag: {widget.post.imageUrl},
                              child: Image(
                                image: AssetImage(widget.post.imageUrl),
                                fit: BoxFit.fitWidth,
                              ),
                            )
                            : Container(),
                            Hero(
                              tag: 'bottom',
                              child: Container(                                      //bottom cua post card
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
                                              Material(
                                                color: Colors.white,
                                                child: InkWell(
                                                  onTap: changeColor,
                                                  child: Icon(
                                                    CustomIcon.up_bold,
                                                    color: isVoted == true ? Colors.green : textColor2,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8,),
                                              Text(
                                                widget.post.upvotes.toString(), 
                                                style: TextStyle(
                                                  color: isVoted ? Colors.green : textColor2, 
                                                  fontWeight: FontWeight.w600),
                                              ),
                                              const SizedBox(width: 8,),
                                              const Icon(CustomIcon.down_bold, color: textColor2,),
                                                
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
                              ),
                            )
                          ],
                        ),
                      ),
                      const BestCommentsButton(),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: comment.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          var itemData = comment.data![index];
                          return CommentCard(comment: itemData);
                        }
                      ),
                      const SizedBox(height: 60,)
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

class BestCommentsButton extends StatelessWidget {
  const BestCommentsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      // width: MediaQuery.of(context).size.width,
      color: seperateColor,
      padding: const EdgeInsets.only(left: 12),
      height: 50,
      child: Material(
        color: seperateColor,
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
                      top: Radius.circular(12.0)
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('SORT POSTS BY', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.rocket, text: 'Best', isChoose: true),
                      DialogOption(icon: Icons.stacked_bar_chart, text: 'Top', isChoose: false),
                      DialogOption(icon: Icons.star_border, text: 'New', isChoose: false),
                      DialogOption(icon: Icons.shield_outlined, text: 'Controversial', isChoose: false),
                      DialogOption(icon: Icons.timer_outlined, text: 'Old', isChoose: false),
                      DialogOption(icon: Icons.mic, text: 'Q&A', isChoose: false),
                    ],
                  ),
                ),
              ) 
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.rocket, color: textColor2,),
                Text('BEST COMMENTS', style: TextStyle(color: textColor2, fontSize: 12, fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_drop_down_outlined, color: textColor2,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}