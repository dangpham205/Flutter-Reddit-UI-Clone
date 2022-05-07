import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class UploadScreen extends StatefulWidget {

  final bool havePop;
  const UploadScreen({ Key? key, required this.havePop }) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: widget.havePop ?
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close)
        )
        : Container(), 
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(26.0),
                    top: Radius.circular(26.0)
                  ),
                  color: controller.text.isNotEmpty  ? darkblue : textColor2,
                ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                      ),
                  )
                )
              ),
            ],
          ),
          const SizedBox(width: 12,)
        ],
        
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              maxLines: 12,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                fillColor: seperateColor,
                hintText: 'Write something',
                focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                    ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const[
            Divider(thickness: 2,),
            BottomOptions(icon: Icons.image, text: 'Image',),
            BottomOptions(icon: Icons.play_arrow, text: 'Video',),
            BottomOptions(icon: Icons.text_fields, text: 'Text',),
            BottomOptions(icon: Icons.add_link, text: 'Link',),
            BottomOptions(icon: Icons.face_rounded, text: 'Poll',),
          ],
        ),
      ),
    );
  }
}

class BottomOptions extends StatelessWidget {


  const BottomOptions({
    Key? key, required this.icon, required this.text
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 26,color: textColor2,),
          const SizedBox(width: 12,),
          Text(text, style: const TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}