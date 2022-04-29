import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midterm_519h0277/views/introduce_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.red,
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


