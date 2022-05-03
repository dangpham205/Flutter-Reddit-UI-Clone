import 'package:flutter/material.dart';

class DialogOption2 extends StatelessWidget {

  const DialogOption2({ Key? key, required this.icon, required this.text, }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 16,),
          Expanded(child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, color:Colors.black),)),

        ],
      ),
    );
  }
}