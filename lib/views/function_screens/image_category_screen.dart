import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:midterm_519h0277/views/function_screens/post_detail_screen.dart';

import '../../constants/colors.dart';
import '../../models/post.dart';

class ImageCategoryScreen extends StatefulWidget {

  final String title;

  const ImageCategoryScreen({ Key? key, required this.title }) : super(key: key);

  @override
  State<ImageCategoryScreen> createState() => _ImageCategoryScreenState();
}

class _ImageCategoryScreenState extends State<ImageCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title, style: const TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder(
        future: Post.getPostsWithImage(context),
        builder:(BuildContext context, AsyncSnapshot<List<Post>> post) {
          return StaggeredGridView.countBuilder(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 2, 
            itemCount: post.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return ImageStack(post: post.data![index],);
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(
                // (index % 5 == 1) ? 1 : 2,
                // (index % 5 == 0) ? 1 : 2,
                (index % 5 == 0) ? 2 : 1,     //cross axis cells count
                (index % 5 == 0) ? 2 : 1, 
              );
            },
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          );
        }
      )
    );
  }
}

class ImageStack extends StatelessWidget {
  const ImageStack({
    Key? key, required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: seperateColor,
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetailScreen(post: post)));
        },
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                return Image(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  image: AssetImage(post.imageUrl),
                  fit: BoxFit.fitHeight,                
                );
              }
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
                  Text("r/"+post.channel, style: const TextStyle(color: Colors.white),),
                  const SizedBox(height: 8,),
                  Text.rich(
                    TextSpan(
                      children: [
                        post.title.length < 29 ?
                        TextSpan(
                          text: post.title,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        )
                        :
                        TextSpan(
                          text: post.title.substring(0,30)+"...",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      ]
                    )
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}