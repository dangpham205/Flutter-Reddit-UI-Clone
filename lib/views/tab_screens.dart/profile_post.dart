import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/post.dart';
import '../../widgets/post_card.dart';

class PostsTab extends StatefulWidget {

  final bool? havePosts;
  const PostsTab({ Key? key, this.havePosts }) : super(key: key);

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  @override
  Widget build(BuildContext context) {
    return widget.havePosts!
        ? ListView(
          children: [FutureBuilder(
            future: Post.getPosts(context),
            builder: (BuildContext context, AsyncSnapshot<List<Post>> post) {
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Column(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: post.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var itemData = post.data![index];
                      return PostCard(
                        post: itemData,
                      );
                    }
                  ),
                ],
              ),
            );
            }
          ),]
        ): 
      Container(
        color: seperateColor,
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.tag_faces_sharp, color: textColor2, size: 60,),
              SizedBox(height: 8,),
              Text('Wow, such empty', style: TextStyle(color: textColor2),)
            ],
          ),
    );
  }
}