import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DialogOption extends StatelessWidget {

  const DialogOption({ Key? key, this.icon, required this.text, required this.isChoose }) : super(key: key);

  final IconData? icon;
  final String text;
  final bool isChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon != null ?
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(icon, color: isChoose ? Colors.black : textColor2,),
          )
          : const SizedBox.shrink(),
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