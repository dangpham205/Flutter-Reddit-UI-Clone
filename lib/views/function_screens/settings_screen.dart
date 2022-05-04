import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text('Settings', style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: seperateColor,
        child: ListView(
          children: const [
            DividerTitle(title: 'PREMIUM'),
            DividerTitle(title: 'VIEW OPTIONS'),
            DividerTitle(title: 'DARK MODE'),
            DividerTitle(title: 'ADVANCED'),
            DividerTitle(title: 'ABOUT'),
            DividerTitle(title: 'SUPPORT'),
            DividerTitle(title: 'BUILD INFORMATION'),
          ]
        ),
      )
    );
  }
}


class DividerTitle extends StatelessWidget {
  const DividerTitle({ Key? key, required this.title }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: seperateColor,
      padding: const EdgeInsets.only(left: 12),
      height: 50,
      child: Text(title, style: const TextStyle(color: textColor2, fontSize: 12, fontWeight: FontWeight.bold),)
    );
  }
}