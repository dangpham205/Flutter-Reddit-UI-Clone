import 'package:flutter/material.dart';

class DialogTransition extends StatefulWidget {

  final Dialog dialog;
  const DialogTransition({Key? key, required this.dialog}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DialogTransitionState();
}

class DialogTransitionState extends State<DialogTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;


  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: widget.dialog,
        ),
      ),
    );
  }
}