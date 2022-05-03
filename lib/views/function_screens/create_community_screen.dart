import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';

import '../../widgets/dialog_option_without_tick.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({ Key? key }) : super(key: key);

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {

  final TextEditingController controller = TextEditingController();
  bool _value = false;

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
        title: const Text('Create a community', style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 12, bottom: 16, right: 12, top: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Community name', style: TextStyle(color: textColor2, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 8,),
                  Container(
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    color: seperateColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Text('r/', style: TextStyle(color: Colors.grey),)),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Community_name',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          )
                        ),
                        const Center(child: Text('21', style: TextStyle(color: textColor2),)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  const Text('Community type', style: TextStyle(color: textColor2, fontWeight: FontWeight.w500),),
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context, 
                          builder: (context) => Dialog(
                            alignment: Alignment.bottomCenter,
                            // insetPadding: EdgeInsets.only(top: 100),
                            insetPadding: EdgeInsets.zero,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(12.0),
                                  top: Radius.circular(12.0)
                                ),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(26.0),
                                          top: Radius.circular(26.0)
                                        ),
                                        color: dividerColor,
                                      ),
                                      width: 36,
                                      height: 4,
                                    ),
                                  ),
                                  const SizedBox(height: 16,),
                                  const Center(child: Text('Community type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                                  const SizedBox(height: 16,),
                                  const DialogOption2(
                                    icon: Icons.person, 
                                    text: 'Public', 
                                    info: "Anyone can view, post, and comment to this community",
                                  ),
                                  const DialogOption2(
                                    icon: Icons.check, 
                                    text: 'Restricted',
                                    info: "Anyone can view this community, but only approved users can post",
                                  ),
                                  const DialogOption2(
                                    icon: Icons.lock, 
                                    text: 'Private',
                                    info: "Only approved users can view and submit to this community",
                                  ),
                                ],
                              ),
                            ),
                          ) 
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Public', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('18+ community', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      CupertinoSwitch(
                        value: _value,
                        onChanged: (newValue) => setState(() => _value = newValue),
                      )
                    ],
                  ),
                  const SizedBox(height: 24,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(26.0),
                        top: Radius.circular(26.0)
                      ),
                      color: controller.text.isNotEmpty  ? darkblue : textColor2,
                    ),
                      child: const Center(
                        child: Text(
                          'Create community',
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold
                          ),
                      )
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}