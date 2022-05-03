import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';

class DialogOption2 extends StatelessWidget {

  const DialogOption2({ Key? key, required this.icon, required this.text, this.info, }) : super(key: key);

  final IconData icon;
  final String text;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text, style: const TextStyle(fontWeight: FontWeight.bold, color:Colors.black),),
                info != null
                ? Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: Text(info!, style: const TextStyle(color:textColor2, fontSize: 12),),
                )
                : const SizedBox.shrink()
              ],
            )),

        ],
      ),
    );
  }
}