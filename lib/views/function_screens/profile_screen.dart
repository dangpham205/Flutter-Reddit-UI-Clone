import 'package:flutter/material.dart';
import 'package:midterm_519h0277/models/redditor.dart';

class ProfileScreen extends StatefulWidget {
  final Redditor redditor;
  const ProfileScreen({ Key? key, required this.redditor }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 60),
                child: Icon(Icons.arrow_back, color: Colors.white,),
              ),
            ),
            leadingWidth: 44,
            title: Text(widget.redditor.name),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widget.redditor.backgroundUrl, fit: BoxFit.cover,),
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 650,
                  width: 150,
                  color: Colors.black,
                )
              ]
            )
          )
        ],
      ),
    );
  }
}