import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../views/introduce_screen.dart';
// C:\Users\Admin\Documents\scr\
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Reddit',
      theme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.transparent, 
            statusBarIconBrightness: Brightness.dark,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      
      home: const IntroduceScreen(),
    );
  }
}


