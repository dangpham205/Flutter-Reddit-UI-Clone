import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ChannelMenuTab extends StatefulWidget {
  const ChannelMenuTab({ Key? key }) : super(key: key);

  @override
  State<ChannelMenuTab> createState() => _ChannelMenuTabState();
}

class _ChannelMenuTabState extends State<ChannelMenuTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:12, bottom: 12),
      color: seperateColor,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Blog', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(height: 12,),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Contact Us', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(height: 12,),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Help', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(height: 12,),
          
        ]
      )
    );
  }
}