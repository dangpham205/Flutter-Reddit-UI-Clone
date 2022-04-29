import 'package:flutter/material.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({ Key? key }) : super(key: key);

  @override
  State<PopularTab> createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('pop'),
    );
  }
}