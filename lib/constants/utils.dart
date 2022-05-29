import 'package:flutter/material.dart';

showSnackBar( BuildContext context, String content, Color color){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      duration: const Duration(milliseconds: 1300),
      content: Row(
        children: [
          const Icon(Icons.reddit, color: Colors.white, size: 32,),
          const SizedBox(width: 12,),
          Text(content, style: const TextStyle(color: Colors.white, fontSize: 16),),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 24, left: 12, right: 12),
    ),
  );
}
