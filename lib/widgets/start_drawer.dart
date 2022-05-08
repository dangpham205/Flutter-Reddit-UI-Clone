import 'dart:convert';

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../views/function_screens/channel_screen.dart';
import '../views/function_screens/create_community_screen.dart';
import '../widgets/reddit_card.dart';

import '../models/reddit.dart';

class StartDrawer extends StatefulWidget {
  const StartDrawer({ Key? key }) : super(key: key);

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {

  late Reddit redditchannel;

  void getRedditChannel(BuildContext context, String channelname) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/reddit.json");
    var tagObjsJson = jsonDecode(data)['reddit'] as List;
    List<Reddit> reddits = tagObjsJson.map((tagJson) => Reddit.fromJSON(tagJson)).toList();
    for (Reddit r in reddits){
      if (r.name == channelname){
        redditchannel = r;
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 12,right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: dividerColor, ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Recently Visited', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text('See all')
                  ],
                ),
                const SizedBox(height: 14,),
                drawerItem(text: "r/visitedreddit",avatar: "assets/image/logo1.png",haveFavorite: false),
                const Divider(color: dividerColor,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Your Communities', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Icon(Icons.arrow_drop_down_sharp, color: textColor2,)
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateCommunityScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: drawerItem(text: "Create a community",icon: Icons.add ,haveFavorite: false),
                  ),
                ),
                FutureBuilder(
                  future: Reddit.getReddits(context),
                  builder: (BuildContext context, AsyncSnapshot<List<Reddit>> reddit) {
                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: reddit.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var itemData = reddit.data![index];
                        return InkWell(
                          onTap: () {
                            getRedditChannel(context, itemData.name);
                            Future.delayed(const Duration(milliseconds: 100)).then((value) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChannelScreen(reddit: redditchannel)));
                            });
                          },
                          child: RedditCard(
                            reddit: itemData,
                            withJoinButton: false,
                          ),
                        );
                      }
                    ),
                  );
                  }
                ),
                drawerItem(text: "Custom Feeds",icon: Icons.dashboard_customize ,haveFavorite: true),
                const Divider(color: dividerColor,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: drawerItem(text: "All",icon: Icons.all_out,haveFavorite: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerItem(
      {String? text,
      IconData? icon,
      String? avatar,
      VoidCallback? function,
      bool? haveFavorite}) {
    
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: function,
            child: Row(
              children: [
                avatar != null ?
                CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(avatar),
                  backgroundColor: seperateColor,
                )
                : Icon(icon, size: 30,),
                Text("   " + text!),
                Expanded(child: Container()),
                haveFavorite == true ?
                const Icon(Icons.star_border, color: textColor2,)
                : Container()
              ],
            ),
          ),
        ),
        const SizedBox(height: 16,)
      ],
    );
  }
}