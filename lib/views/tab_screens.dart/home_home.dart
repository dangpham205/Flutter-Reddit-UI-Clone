import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/post.dart';
import 'package:midterm_519h0277/widgets/dialog_option.dart';

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
                                DialogOption(icon: Icons.rocket, text: 'Best', isChoose: true),
                                DialogOption(icon: Icons.whatshot_outlined, text: 'Hot', isChoose: false),
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
                              ),
                            ],
                          );
  }
}