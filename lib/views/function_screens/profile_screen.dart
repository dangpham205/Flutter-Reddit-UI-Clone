import 'package:flutter/material.dart';
import 'package:midterm_519h0277/models/redditor.dart';
import 'package:midterm_519h0277/views/tab_screens.dart/profile_about.dart';
import 'package:midterm_519h0277/views/tab_screens.dart/profile_comment.dart';
import 'package:midterm_519h0277/views/tab_screens.dart/profile_post.dart';

import '../../constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  final Redditor redditor;
  const ProfileScreen({ Key? key, required this.redditor }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              title: Text(widget.redditor.name),
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.50,
              actions: const [
                Icon(Icons.share_outlined, color: Colors.white,),
                SizedBox(width: 12,),
                Icon(Icons.more_vert, color: Colors.white,),
                SizedBox(width: 8,),
              ],
              flexibleSpace: FlexibleSpaceBar(
                // background: Image.asset(widget.redditor.backgroundUrl, fit: BoxFit.cover,),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(widget.redditor.backgroundUrl, fit: BoxFit.cover,),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16,),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage(widget.redditor.avatarUrl),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Row(
                                children: [
                                  widget.redditor.id == "1"
                                  ? Container(            //start direct chat o dau screen
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2
                                          // width: 5,
                                        ),
                                        borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(26.0),
                                          top: Radius.circular(26.0)
                                        ),
                                        color: Colors.transparent,
                                      ),
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )
                                  : Row(
                                    children: [
                                      Container(            //start direct chat o dau screen
                                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2
                                              // width: 5,
                                            ),
                                            borderRadius: const BorderRadius.vertical(
                                              bottom: Radius.circular(26.0),
                                              top: Radius.circular(26.0)
                                            ),
                                            color: Colors.transparent,
                                          ),
                                          child: const Text(
                                            'Follow',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16
                                            ),
                                          ),
                                        ),
                                      const SizedBox(width: 8,),
                                      Container(            //start direct chat o dau screen
                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2
                                            // width: 5,
                                          ),
                                          borderRadius: const BorderRadius.vertical(
                                            bottom: Radius.circular(26.0),
                                            top: Radius.circular(26.0)
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        child: const Icon(Icons.chat_outlined, color: Colors.white,)
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Text(widget.redditor.bio,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                              ),
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              children: [
                                Text('u/'+ widget.redditor.name, style: const TextStyle(color: Colors.white),),
                                const SizedBox(width: 4,),
                                const Icon(Icons.circle,color: Colors.white, size: 6,),
                                const SizedBox(width: 4,),
                                Text(widget.redditor.age, style: const TextStyle(color: Colors.white),),
                                const SizedBox(width: 4,),
                                const Icon(Icons.circle, color: Colors.white, size: 6,),
                                const SizedBox(width: 4,),
                                Text(widget.redditor.karma.toString() + " karma", style: const TextStyle(color: Colors.white),),
                              ],
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
                            child: Text('Comments', style: TextStyle(color: Colors.black),),
                          ), 
                          Tab(
                            child: Text('About', style: TextStyle(color: Colors.black),),
                          ), 
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        height: 650,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(
                        children: [
                          const PostsTab(),
                          const CommentsTab(),
                          AboutTab(redditor: widget.redditor,),
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