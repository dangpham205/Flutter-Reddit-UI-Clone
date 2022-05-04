import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constants/colors.dart';
import '../../models/post.dart';
import '../../widgets/end_drawer.dart';
import '../../widgets/start_drawer.dart';
import '../function_screens/post_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({ Key? key }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const StartDrawer(),
        endDrawer: const EndDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: seperateColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    ),
                  )
                )
              ],
            ),
          ),
          actions: [
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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight+8),
            child: Category()),
        ),
        body: Container(
          color: seperateColor,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              FutureBuilder(
                future: Post.getPostsWithImage(context),
                builder:(BuildContext context, AsyncSnapshot<List<Post>> post) {
                  return StaggeredGridView.countBuilder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    crossAxisCount: 2, 
                    itemCount: post.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: seperateColor,
                        padding: const EdgeInsets.all(12),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetailScreen(post: post.data![index])));
                          },
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage(post.data![index].imageUrl),
                                fit: BoxFit.cover,
                              ),
                              LayoutBuilder(      //xài cái này để lấy ra height, width của parent
                                builder: (BuildContext context, BoxConstraints constraints){
                                  return Container(
                                    height: constraints.maxHeight/3,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(1),
                                          Colors.black.withOpacity(0.05),
                                        ],
                                      )
                                    ),
                                  );
                                }
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("r/"+post.data![index].channel, style: const TextStyle(color: Colors.white),),
                                    const SizedBox(height: 8,),
                                    Text(post.data![index].title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              )
                            ]
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(
                        // (index % 5 == 1) ? 1 : 2,
                        // (index % 5 == 0) ? 1 : 2,
                        (index % 7 == 0) ? 2 : 1,     //cross axis cells count
                        (index % 7 == 0) ? 2 : 1, 
                      );
                    },
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  );
                }
              )
            ],
          ),
        ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(               //category
        height: 60,
        color: seperateColor,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: const [
                SizedBox(width: 12,),
                CategoryButtons(name: "Art"),
                CategoryButtons(name: "Technology"),
                CategoryButtons(name: "Celebrity"),
                CategoryButtons(name: "Fashion"),
                CategoryButtons(name: "Beauty"),
                CategoryButtons(name: "Funny"),
                CategoryButtons(name: "Memes"),
                CategoryButtons(name: "Television"),
                CategoryButtons(name: "Food"),
                CategoryButtons(name: "Movies"),
                CategoryButtons(name: "Hobbies"),
                SizedBox(width: 12,),
              ],
            );
          }
        ),
      ),
    );
  }
}

class CategoryButtons extends StatelessWidget {
  final String name;

  const CategoryButtons({
    Key? key, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(26.0),
            top: Radius.circular(26.0)
          ),
          color: Colors.white,
        ),
        child: Text(name,style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
      ),
    );
  }
}