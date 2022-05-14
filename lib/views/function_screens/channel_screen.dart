import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/reddit.dart';
import '../../views/tab_screens.dart/channel_about.dart';
import '../../views/tab_screens.dart/channel_menu.dart';

import '../../widgets/custom_search_delegate.dart';
import '../tab_screens.dart/profile_post.dart';

class ChannelScreen extends StatefulWidget {

  final Reddit reddit;

  const ChannelScreen({ Key? key, required this.reddit }) : super(key: key);

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 60),
                  child: Icon(Icons.arrow_back, color: Colors.white,),
                ),
              ),
              leadingWidth: 44,
              title: Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8.0),
                    top: Radius.circular(8.0)
                  ),
                  color: seperateColor,
                ),
                child: Material(
                  color: seperateColor,
                  child: InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: CustomSearchDelegate());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.search, size: 20, color: textColor2,),
                        Text('  Search', style: TextStyle(color: textColor2, fontSize: 14),)
                      ],
                    ),
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.50,
              actions: const[
                Icon(Icons.share_outlined, color: Colors.white,),
                SizedBox(width: 16,),
                Icon(Icons.more_vert, color: Colors.white,),
                SizedBox(width: 16,),
              ],
              flexibleSpace: FlexibleSpaceBar(
                // background: Image.asset(widget.redditor.backgroundUrl, fit: BoxFit.cover,),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/image/df_bg.jpg', fit: BoxFit.cover, height: 250,),
                        Expanded(child: Container(color: Colors.white,))
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage(widget.reddit.avatarUrl),
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              children: [
                                Text(widget.reddit.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                const SizedBox(width: 12,),
                                Row(
                                  children: [
                                    Container(            
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: redditColor,
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(26.0),
                                          top: Radius.circular(26.0)
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: const Icon(Icons.notifications, color: redditColor,),    
                                    ),
                                    const SizedBox(width: 12,),
                                    Container(            //start direct chat o dau screen
                                      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: redditColor,
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(26.0),
                                          top: Radius.circular(26.0)
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: const Text('Join', style: TextStyle(color: redditColor, fontWeight: FontWeight.bold,fontSize: 12),),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                children: [
                                  Text(widget.reddit.members.toString() + " members", style: const TextStyle(fontSize: 12, color: textColor2),)
                                ],
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(widget.reddit.bio,
                              style: const TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                              ),
                            ),
                            const SizedBox(height: 24,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      const TabBar(
                        unselectedLabelColor: textColor2,
                        labelColor: Colors.white,
                        tabs: [
                          Tab(
                            child: Text('Posts', style: TextStyle(color: Colors.black),),
                          ),
                          Tab(
                            child: Text('About', style: TextStyle(color: Colors.black),),
                          ), 
                          Tab(
                            child: Text('Menu', style: TextStyle(color: Colors.black),),
                          ), 
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        height: 650,
                        width: MediaQuery.of(context).size.width,
                        child: const TabBarView(
                        children: [
                          PostsTab(havePosts: false,),
                          ChannelAboutTab(),
                          ChannelMenuTab(),
                        ]
                      )
                      ),
                    ],
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}