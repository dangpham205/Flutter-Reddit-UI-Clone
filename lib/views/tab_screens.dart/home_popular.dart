import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/post.dart';
import '../../../widgets/post_card.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({ Key? key }) : super(key: key);

  @override
  State<PopularTab> createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: seperateColor,
        child: ListView(
          children: [
            FutureBuilder(
            future: Post.getPosts(context),
            builder: (BuildContext context, AsyncSnapshot<List<Post>> post) {
            return MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Column(
                children: [
                  const TopScreenButtons(),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: post.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      if (post.data![index].isMember == "false"){
                        var itemData = post.data![index];
                        return PostCard(
                          post: itemData,
                        );
                      }
                      else {
                        return Container();
                      }
                    }
                  ),
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

class TopScreenButtons extends StatelessWidget {
  const TopScreenButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: seperateColor,
          child: InkWell(
            onTap: () {
              
            },
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              width: 130,
              height: 50,
              child: Row(
                children: const [
                  Icon(Icons.local_fire_department_outlined , color: textColor2,),
                  Text('HOT POSTS', style: TextStyle(color: textColor2, fontSize: 12, fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_drop_down_outlined, color: textColor2,)
                ],
              ),
            ),
          ),
        ),
        Material(
          color: seperateColor,
          child: InkWell(
            onTap: () {
              
            },
            child: SizedBox(
              width: 80,
              height: 50,
              child: Row(
                children: const [
                  Icon(Icons.pin_drop_outlined , color: textColor2,),
                  Text('GLOBAL', style: TextStyle(color: textColor2, fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        Material(
          color: seperateColor,
          child: InkWell(
            onTap: () {
              
            },
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.only(right: 12),
              child: const Icon(Icons.slideshow, color: textColor2,)),
          ),
        )
      ],
    );
  }
}