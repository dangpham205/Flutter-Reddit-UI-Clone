import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/views/function_screens/search_screen.dart';
import 'package:midterm_519h0277/views/tab_screens.dart/home_home.dart';
import 'package:midterm_519h0277/views/tab_screens.dart/home_popular.dart';
import 'package:midterm_519h0277/widgets/end_drawer.dart';
import 'package:midterm_519h0277/widgets/start_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const StartDrawer(),
        endDrawer: const EndDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8.0),
                top: Radius.circular(8.0)
              ),
              color: seperateColor,
            ),
            child: Material(
              color: seperateColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.search, size: 20, color: textColor2,),
                    Text('  Search', style: TextStyle(color: textColor2, fontSize: 14),)
                    // Expanded(
                    //   flex: 1,
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'Search',
                    //       hintStyle: TextStyle(color: Colors.grey),
                    //       icon: Icon(
                    //         Icons.search,
                    //         color: Colors.grey,
                    //       )
                    //     ),
                    //   )
                    // )
                  ],
                ),
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Home', style: TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text('Popular', style: TextStyle(color: Colors.black),),
              ),              
            ],
          ),
          actions: [
            Builder(
              builder: (context) => TextButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();   //openenddrawer
                }, 
                child: const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/image/reddit_avatar.png'),
                ),
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            HomeTab(),
            PopularTab(),
          ]
        ),
      ),
    );
  }
}