import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/redditor.dart';
import 'package:midterm_519h0277/views/function_screens/profile_screen.dart';
import 'package:midterm_519h0277/views/function_screens/settings_screen.dart';

import '../views/function_screens/create_community_screen.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({ Key? key }) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {

  late Redditor redditor;

  void getRedditor1(BuildContext context) async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/redditor.json");
    var tagObjsJson = jsonDecode(data)['redditor'] as List;
    List<Redditor> redditors = tagObjsJson.map((tagJson) => Redditor.fromJSON(tagJson)).toList();
    redditor = redditors[0];
  }

  @override
  void initState() {
    super.initState();
    getRedditor1(context);
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.76,
      child: Drawer(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 10,right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,    //center casc children
                      children: [
                        SizedBox(
                          height: 250, 
                          width: MediaQuery.of(context).size.width*0.66, 
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 220, 
                            width: MediaQuery.of(context).size.width*0.66, 
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: seperateColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Center(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                
                                  },
                                  child: const Image(
                                    image: AssetImage('assets/image/reddit_figure.png'),
                                    height: 160,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                                  child: Material(
                                    color: seperateColor,
                                    child: InkWell(
                                      onTap: () {
                                        
                                      },
                                      child: Row(
                                        children: const [
                                          Text('u/Old-Complex567', style: TextStyle(fontWeight: FontWeight.bold),),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(26.0),
                                      top: Radius.circular(26.0)
                                    ),
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.circle, color: redditColor,size: 12,),
                                      Text(' Online Status: On', style: TextStyle(color: redditColor),)
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          )
                        ),
                        
                      ],
                    )
                  ],
                ),
                Padding(      //nút Create Avatar
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(26.0),
                          top: Radius.circular(26.0)
                        ),
                        color: redditColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(' '),
                          Text(' Create Avatar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_outlined, color: Colors.white,),
                        ],
                      ),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.ac_unit, color: Color.fromARGB(255, 31, 16, 237),),
                              const SizedBox(width: 8,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                  Text('Karma', style: TextStyle(color: textColor2, fontSize: 12),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(width: 1,height: 40,color: dividerColor,),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.cake, color: Color.fromARGB(255, 31, 16, 237),),
                              const SizedBox(width: 8,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('1y 1m', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                  Text('Reddit age', style: TextStyle(color: textColor2, fontSize: 12),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Divider(color: dividerColor, thickness: 1,),
                ),
                drawerItem(
                  icon: Icons.person_outline,
                  text: 'My Profile',
                  function: () {
                    Future.delayed(const Duration(milliseconds: 100)).then((value) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(redditor: redditor)));
                    });
                  }
                ),
                const SizedBox(height: 4,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateCommunityScreen()));
                  },
                  child: drawerItem(icon: Icons.add, text: 'Create a community')
                ),
                const SizedBox(height: 4,),
                drawerItem(icon: Icons.money, text: 'Reddit Coins'),
                const SizedBox(height: 4,),
                drawerItem(icon: Icons.shield_outlined, text: 'Reddit Premium'),
                const SizedBox(height: 4,),
                drawerItem(icon: Icons.bookmark_border, text: 'Saved'),
                Flexible(child: Container(), flex: 1,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
                  },
                  child: drawerItem(icon: Icons.settings, text: 'Settings')),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget drawerItem(
      {required IconData icon,
      required String text,
      String? subText,
      VoidCallback? function,
      }) {
    
    return InkWell(
      onTap: function,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0,top: 6),
            child: Row(
              children: [
                Icon(icon, size: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(text, style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                      subText == null ?
                      Container()
                      : Text(subText, style: const TextStyle(color: textColor2, fontSize: 12),)
                    ],
                  ),
                ),                
              ],
            ),
          ),
        ],
      ),
    );
  }
}