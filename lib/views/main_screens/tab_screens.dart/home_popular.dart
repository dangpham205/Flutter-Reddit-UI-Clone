import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({ Key? key }) : super(key: key);

  @override
  State<PopularTab> createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
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
              child: Column(
                children: [
                  Row(
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
                          child: Container(
                            padding: const EdgeInsets.only(left: 12),
                            width: 90,
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