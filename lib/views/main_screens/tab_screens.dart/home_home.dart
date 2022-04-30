import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/reddit.dart';
import 'package:midterm_519h0277/widgets/reddit_card.dart';

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width, 
          child: SafeArea(
            child: Container(
              color: seperateColor,
              // padding: const EdgeInsets.only(left: 18, right: 18, top: 8),
              child: Column(
                children: [
                  Row(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}