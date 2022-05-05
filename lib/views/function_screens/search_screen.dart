import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    ),
                  )
                ),
                InkWell(
                  onTap: () {

                  },
                  child: const Icon(Icons.close, color: textColor2,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}