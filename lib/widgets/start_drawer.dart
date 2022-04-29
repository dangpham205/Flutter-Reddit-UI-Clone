import 'package:flutter/material.dart';

class StartDrawer extends StatefulWidget {
  const StartDrawer({ Key? key }) : super(key: key);

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 48,),
            drawerItem(
              text: 'Settings',
              icon: Icons.settings,
              function: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => ,
                // ));
              },
            ),
            drawerItem(
              text: 'Saved',
              icon: Icons.bookmark,
              function: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) =>,
                // ));
              }
            ),
            const Divider(color: Colors.white,),
            drawerItem(
              text: 'Log Out',
              icon: Icons.logout,
              function: () async {

              },
            )
          ],
        ),
      ),
    );
  }

  Widget drawerItem({required String text, required IconData icon, VoidCallback? function}) {
    
    const color = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color),),
      onTap:function,
    );
  }
}