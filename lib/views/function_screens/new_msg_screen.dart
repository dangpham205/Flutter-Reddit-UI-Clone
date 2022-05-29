import 'package:flutter/material.dart';
import 'package:midterm_519h0277/constants/colors.dart';

class NewMsgScreen extends StatefulWidget {
  const NewMsgScreen({ Key? key }) : super(key: key);

  @override
  State<NewMsgScreen> createState() => _NewMsgScreenState();
}

class _NewMsgScreenState extends State<NewMsgScreen> {

  final TextEditingController controller = TextEditingController();
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {}); // setState every time text changes
    });
    controller1.addListener(() {
      setState(() {}); // setState every time text changes
    });
    controller2.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
    controller2.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: const Text('New message', style: TextStyle(color: Colors.black),),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back, color: Colors.black,)
        ),
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
                  color: (controller.text.isNotEmpty && controller1.text.isNotEmpty && controller2.text.isNotEmpty)   ? darkblue : textColor2,
                ),
                  child: const Center(
                    child: Text(
                      'SEND',
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

        ]
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: bg2,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    fillColor: seperateColor,
                    hintText: 'Username',
                    isDense: true,
                    prefixIcon:Text("u/", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  ),
                ),
                TextFormField(
                  controller: controller1,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    fillColor: seperateColor,
                    hintText: 'Subject',
                  ),
                ),
                TextFormField(
                  controller: controller2,
                  maxLines: 24,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    fillColor: seperateColor,
                    hintText: 'Message',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}