import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class SettingOption extends StatefulWidget {

  const SettingOption(
      {Key? key,
      required this.icon,
      required this.text,
      required this.hasDialog,
      this.dialogText,
      this.dialog,
      required this.hasSwitch,
      this.function})
      : super(key: key);

  final IconData icon;
  final String text;
  final bool hasDialog;
  final bool hasSwitch;
  final String? dialogText;
  final Dialog? dialog;
  final VoidCallback? function;

  @override
  State<SettingOption> createState() => _SettingOptionState();
}

class _SettingOptionState extends State<SettingOption> {
  
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

    
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 8,bottom: 8, right: 6, left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(widget.icon, color: textColor3,),
          const SizedBox(width: 16,),
          Expanded(child: Text(widget.text, style: const TextStyle(fontWeight: FontWeight.bold, color:Colors.black),)),
          (widget.hasDialog && widget.dialog != null) ? 
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                showGeneralDialog(
                  context: context, 
                  transitionDuration: const Duration(milliseconds: 320),
                  barrierDismissible: true,
                  barrierLabel: "Barrier",
                  barrierColor: Colors.black.withOpacity(0.6),
                  transitionBuilder: (_, anim, __, child) {
                    Tween<Offset> tween;
                    if (anim.status == AnimationStatus.reverse) {
                      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
                    } else {
                      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
                    }
                    return SlideTransition(
                      position: tween.animate(anim),
                      child: FadeTransition(
                        opacity: anim,
                        child: child,
                      ),
                    );
                  },
                  pageBuilder: (_,__,___) => widget.dialog!
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:6.0),
                child: Row(
                  children: [
                    Text(widget.dialogText!, style: const TextStyle(color: textColor2, fontSize: 12),),
                    const Icon(Icons.arrow_drop_down, color: textColor2,)
                  ],
                ),
              ),
            ),
          )
          : widget.hasSwitch ?
          CupertinoSwitch(
            value: _value,
            onChanged: (newValue) => setState(() => _value = newValue),
          )
          : Material(
            color: Colors.white,
            child: InkWell(
              onTap: widget.function,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Icon(Icons.arrow_forward, color: textColor2,),
              )),
          )
        ],
      ),
    );
  }
}