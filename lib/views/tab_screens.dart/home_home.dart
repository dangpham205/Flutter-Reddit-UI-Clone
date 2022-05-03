import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/post.dart';

import '../../../widgets/post_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({ Key? key }) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  void initState(){
    super.initState();
  }


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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: seperateColor,
                  child: InkWell(
    onTap: () async{
      
    },
    child: Container(
      padding: const EdgeInsets.only(left: 12),
      width: 140,
      height: 50,
      child: Row(
        children: const [
          Icon(Icons.rocket, color: textColor2,),
          Text('BEST POSTS', style: TextStyle(color: textColor2, fontSize: 12, fontWeight: FontWeight.bold),),
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
    child: Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.only(right: 12),
      child: const Icon(Icons.slideshow, color: textColor2,)),
                  ),
                ),
              ],
            );
  }
}