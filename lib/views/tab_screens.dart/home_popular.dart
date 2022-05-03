import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/post.dart';
import '../../../widgets/post_card.dart';
import '../../widgets/dialog_option.dart';

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
              showDialog(
                context: context, 
                builder: (context) => Dialog(
                  alignment: Alignment.bottomCenter,
                  // insetPadding: EdgeInsets.only(top: 100),
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12.0),
                        top: Radius.circular(12.0)
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('SORT POSTS BY', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                        ),
                        Divider(color: dividerColor,),
                        DialogOption(icon: Icons.whatshot_outlined, text: 'Hot', isChoose: true),
                        DialogOption(icon: Icons.star_border, text: 'New', isChoose: false),
                        DialogOption(icon: Icons.stacked_bar_chart, text: 'Top', isChoose: false),
                        DialogOption(icon: Icons.shield_outlined, text: 'Controversial', isChoose: false),
                        DialogOption(icon: Icons.show_chart, text: 'Rising', isChoose: false),
                      ],
                    ),
                  ),
                ) 
              );
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
              showDialog(
                context: context, 
                builder: (context) => Dialog(
                  alignment: Alignment.bottomCenter,
                  // insetPadding: EdgeInsets.only(top: 100),
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12.0),
                        top: Radius.circular(12.0)
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        DialogOption(icon: Icons.heart_broken, text: 'Global', isChoose: true),
                        DialogOption(icon: Icons.location_on_outlined, text: 'My Location', isChoose: false),
                        DialogOption(icon: Icons.monitor_heart_outlined, text: 'Other', isChoose: false),
                      ],
                    ),
                  ),
                ) 
              );
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
              showDialog(
                context: context, 
                builder: (context) => Dialog(
                  alignment: Alignment.bottomCenter,
                  // insetPadding: EdgeInsets.only(top: 100),
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12.0),
                        top: Radius.circular(12.0)
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('POST VIEW', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                        ),
                        Divider(color: dividerColor,),
                        DialogOption(icon: Icons.horizontal_rule_outlined, text: 'Card', isChoose: true),
                        DialogOption(icon: Icons.horizontal_split, text: 'Classic', isChoose: false),
                      ],
                    ),
                  ),
                ) 
              );
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