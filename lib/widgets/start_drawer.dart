import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/widgets/reddit_card.dart';

import '../models/reddit.dart';

class StartDrawer extends StatefulWidget {
  const StartDrawer({ Key? key }) : super(key: key);

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {

  

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
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: drawerItem(text: "Create a community",icon: Icons.add ,haveFavorite: false),
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
                        return RedditCard(
                          reddit: itemData,
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