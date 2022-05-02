import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({ Key? key }) : super(key: key);

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back,color: Colors.black,)),
        title: const Text('New chat', style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16,top: 0, bottom: 10),
          child: Column(
            children: [
              Container(            //start direct chat o dau screen
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: dividerColor,
                    // width: 5,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12.0),
                    top: Radius.circular(12.0)
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.add_link,color: textColor2,size: 26,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Start a direct chat', style: TextStyle(fontWeight: FontWeight.w600),),
                              const SizedBox(height: 4,),
                              Row(
                                children: const [
                                  Text('Limited to 5 invites. ', style: TextStyle(color: textColor2, fontSize: 12),),
                                  Text('Edit link', style: TextStyle(color: darkblue, fontSize: 12),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(26.0),
                            top: Radius.circular(26.0)
                          ),
                          color: darkblue,
                        ),
                        child: const Text('Copy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Container(                //thanh search
                height: 38,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.0),
                    top: Radius.circular(12.0)
                  ),
                  color: seperateColor,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search usernames',
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )
                        ),
                      )
                    )
                  ],
                ),
              ),
              Flexible(child: Container(), flex: 1,),
              Container(            //bottom button 'start chat'
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(26.0),
                    top: Radius.circular(26.0)
                  ),
                  color: seperateColor,
                ),
                child: const Center(
                  child: Text('Start Chat', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}