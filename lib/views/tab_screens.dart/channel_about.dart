import 'dart:convert';

import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/redditor.dart';

import '../../models/reddit.dart';
import '../../widgets/reddit_card.dart';
import '../function_screens/channel_screen.dart';

class ChannelAboutTab extends StatefulWidget {
  const ChannelAboutTab({ Key? key }) : super(key: key);

  @override
  State<ChannelAboutTab> createState() => _ChannelAboutTabState();
}

class _ChannelAboutTabState extends State<ChannelAboutTab> {

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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:12, bottom: 12),
      color: seperateColor,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('About the community', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),),
                Divider(color: dividerColor,),
                Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book')
              ],
            ),
          ),
          const SizedBox(height: 12,),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('About the community', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),),
                const Divider(color: dividerColor,),
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
                            withJoinButton: true,
                          ),
                        );
                      }
                    ),
                  );
                  }
                ),
              ],
            ),
          ),
          const SizedBox(height: 12,),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Moderators', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),),
                const Divider(color: dividerColor,),
                FutureBuilder(
                  future: Redditor.getRedditors(context),
                  builder: (BuildContext context, AsyncSnapshot<List<Redditor>> redditor) {
                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: redditor.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var itemData = redditor.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("u/"+itemData.name),
                        );
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
    );
  }
}