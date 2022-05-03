import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';
import 'package:midterm_519h0277/models/redditor.dart';

class AboutTab extends StatefulWidget {

  final Redditor redditor;
  const AboutTab({ Key? key, required this.redditor }) : super(key: key);

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24, top: 40, right: 24),
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.redditor.karma.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            const SizedBox(height: 4,),
                            const Text('Post Karma', style: TextStyle(color: textColor2),)
                          ],
                        )
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.redditor.karma.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            const SizedBox(height: 4,),
                            const Text('Comment Karma', style: TextStyle(color: textColor2),)
                          ],
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.redditor.karma.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            const SizedBox(height: 4,),
                            const Text('Awarder Karma', style: TextStyle(color: textColor2),)
                          ],
                        )
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.redditor.karma.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            const SizedBox(height: 4,),
                            const Text('Awardee Karma', style: TextStyle(color: textColor2),)
                          ],
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 36,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.mail_outline),
                      SizedBox(width: 12,),
                      Text('Send a message', style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.chat_outlined),
                      SizedBox(width: 12,),
                      Text('Start Chat', style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const SizedBox(height: 16,),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 30,
          padding: const EdgeInsets.only(left: 24),
          width: MediaQuery.of(context).size.width,
          color: seperateColor,
          child: const Center(child: Text("TROPHIES", style: TextStyle(fontWeight: FontWeight.bold, color: textColor2),))
        )
      ],
    );
  }
}