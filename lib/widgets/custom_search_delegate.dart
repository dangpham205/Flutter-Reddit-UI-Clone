import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/redditor.dart';
import 'package:midterm_519h0277/views/function_screens/profile_screen.dart';
import 'package:midterm_519h0277/widgets/redditor_card.dart';

class CustomSearchDelegate extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white, 
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: seperateColor,
        filled: true,
        border: InputBorder.none,
        hintStyle: TextStyle(color: textColor2, fontSize: 14),
        iconColor: textColor2,
        constraints: BoxConstraints(
          maxHeight: 38
        ),
        contentPadding: EdgeInsets.only(bottom: 8, left: 12)
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: textColor2,),
        onPressed: () {
          FocusScope.of(context).unfocus();
          query = '';         //query la bien co san cua flutter, dung de chua gia tri nguoi dung nhap
        },
      ),
    ]; // IconButton
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: textColor2,),
      onPressed: () {
        close(context, null);
      },
    ); // IconButton
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: Redditor.getRedditors(context),
      builder: (BuildContext context, AsyncSnapshot<List<Redditor>> redditor) {
        return MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: redditor.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var itemData = redditor.data![index];
              if (itemData.name.toLowerCase().contains(query.toLowerCase())){
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(redditor: itemData)));
                  },
                  child: RedditorCard(redditor: itemData)
                );
              }
              else{
                return Container();
              }
            }
          )
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: Redditor.getRedditors(context),
      builder: (BuildContext context, AsyncSnapshot<List<Redditor>> redditor) {
        return MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: redditor.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var itemData = redditor.data![index];
              if (itemData.name.toLowerCase().contains(query.toLowerCase())){
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(redditor: itemData)));
                  },
                  child: RedditorCard(redditor: itemData)
                );
              }
              else{
                return Container();
              }
            }
          )
        );
      }
    );
  }
}
