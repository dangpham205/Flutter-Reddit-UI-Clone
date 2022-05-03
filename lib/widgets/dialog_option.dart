import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';

class DialogOption extends StatelessWidget {

  const DialogOption({ Key? key, required this.icon, required this.text, required this.isChoose }) : super(key: key);

  final IconData icon;
  final String text;
  final bool isChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: isChoose ? Colors.black : textColor2,),
          const SizedBox(width: 16,),
          Expanded(child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: isChoose ? Colors.black : textColor2,),)),
          isChoose ? const Icon(Icons.check, color: Colors.black,) : const SizedBox.shrink()

        ],
        // leading: Icon(icon, color: isChoose ? Colors.black : textColor2,),
        // title: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: isChoose ? Colors.black : textColor2,),),
        // trailing: isChoose ? const Icon(Icons.check, color: Colors.black,) : const SizedBox.shrink()
      ),
    );
  }
}