import 'package:flutter/material.dart';
import '../../widgets/setting_screen_option.dart';

import '../../constants/colors.dart';
import '../../widgets/dialog_option.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text('Settings', style: TextStyle(color: Colors.black),),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back, color: Colors.black,)),
      ),
      body: Container(
        color: seperateColor,
        child: ListView(
          children: [
            const DividerTitle(title: 'PREMIUM'),
            SettingOption(
                icon: Icons.shield_outlined,
                text: 'Get Premium',
                hasDialog: false,
                hasSwitch: false,
                function: () {

                },),
            const SettingOption(
                icon: Icons.reddit,
                text: 'Change app icon',
                hasDialog: false,
                hasSwitch: false),
            const SettingOption(
                icon: Icons.checkroom,
                text: 'Style Avatar',
                hasDialog: false,
                hasSwitch: false),
            const DividerTitle(title: 'VIEW OPTIONS'),
            SettingOption(
                icon: Icons.settings_outlined,
                text: 'Language (Beta)',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Use device language',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('LANGUAGE (BETA)', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.check_circle,text: 'Use device language', isChoose: true),
                      DialogOption(icon: Icons.circle_outlined, text: 'English', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Việt Name', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Deutsch', isChoose: false),
                    ],
                  ),
                ),
              ) 
            ),
            SettingOption(
                icon: Icons.horizontal_split,
                text: 'Default View',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Card',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('POST VIEW', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.horizontal_rule_outlined, text: 'Card', isChoose: true),
                      DialogOption(icon: Icons.horizontal_split, text: 'Classic', isChoose: false),
                    ],
                  ),
                ),
              ),
            ),
            SettingOption(
                icon: Icons.play_arrow_outlined,
                text: 'Autoplay',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Always',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('AUTOPLAY', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.check_circle,text: 'Always', isChoose: true),
                      DialogOption(icon: Icons.circle_outlined, text: 'When on Wi-Fi', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Never', isChoose: false),
                    ],
                  ),
                ),
              ) 
            ),
            SettingOption(
                icon: Icons.photo_outlined,
                text: 'Thumbnails',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Community default',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('THUMBNAILS', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.circle_outlined, text: 'Always show', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Never show', isChoose: false),
                      DialogOption(icon: Icons.check_circle,text: 'Community default', isChoose: true),
                    ],
                  ),
                ),
              ) 
            ),
            const SettingOption(
                icon: Icons.remove_red_eye_outlined,
                text: 'Reduce animations',
                hasDialog: false,
                hasSwitch: true),
            const SettingOption(
                icon: Icons.person_outline,
                text: "Show NSFW content (I'm over 18)",
                hasDialog: false,
                hasSwitch: true),
            const SettingOption(
                icon: Icons.warning_amber,
                text: 'Blur NSFW Images',
                hasDialog: false,
                hasSwitch: true),
            const DividerTitle(title: 'DARK MODE'),
            SettingOption(
                icon: Icons.settings_outlined,
                text: 'Auto Dark Mode',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Follow OS setting',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('AUTO DARK MODE', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.circle_outlined, text: 'Off', isChoose: false),
                      DialogOption(icon: Icons.check_circle,text: 'Follow OS setting', isChoose: true),
                      DialogOption(icon: Icons.circle_outlined, text: 'Sunrise/sunset', isChoose: false),
                    ],
                  ),
                ),
              ) 
            ),
            const SettingOption(
                icon: Icons.nightlight_outlined,
                text: 'Dark mode',
                hasDialog: false,
                hasSwitch: true
            ),
            SettingOption(
                icon: Icons.star_border,
                text: 'Light theme',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Alien Blue',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('LIGHT THEME', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.check_circle,text: 'Alien Blue', isChoose: true),
                      DialogOption(icon: Icons.circle_outlined, text: 'Mint', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Pony', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Trees', isChoose: false),
                    ],
                  ),
                ),
              ) 
            ),
            SettingOption(
                icon: Icons.nightlight_outlined,
                text: 'Dark theme',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Night',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('DARK THEME', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.check_circle,text: 'Night', isChoose: true),
                      DialogOption(icon: Icons.circle_outlined, text: 'Midnight (AMOLED)', isChoose: false),
                    ],
                  ),
                ),
              ) 
            ),
            const DividerTitle(title: 'ADVANCED'),
            const SettingOption(
                icon: Icons.photo_outlined,
                text: 'Saved image attribution',
                hasDialog: false,
                hasSwitch: true
            ),
            SettingOption(
                icon: Icons.chat_outlined,
                text: 'Default comment sort',
                hasDialog: true,
                hasSwitch: false,
                dialogText: 'Best',
                dialog: Dialog(
                alignment: Alignment.bottomCenter,
                // insetPadding: EdgeInsets.only(top: 100),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('DEFAULT COMMENT SORT', style: TextStyle(color: textColor2, fontWeight: FontWeight.bold, fontSize: 12),),
                      ),
                      Divider(color: dividerColor,),
                      DialogOption(icon: Icons.check_circle,text: 'Best', isChoose: true),
                      DialogOption(icon: Icons.circle_outlined, text: 'Top', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'New', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Controversial', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Old', isChoose: false),
                      DialogOption(icon: Icons.circle_outlined, text: 'Q&A', isChoose: false),
                    ],
                  ),
                ),
              ) 
            ),
            const SettingOption(
                icon: Icons.web,
                text: 'Open web links in-app',
                hasDialog: false,
                hasSwitch: true
            ),
            const DividerTitle(title: 'ABOUT'),
            const SettingOption(icon: Icons.event_note, text: 'Content policy', hasDialog: false, hasSwitch: false),
            const SettingOption(icon: Icons.settings_outlined, text: 'Privacy policy', hasDialog: false, hasSwitch: false),
            const SettingOption(icon: Icons.person_outline, text: 'User agreement', hasDialog: false, hasSwitch: false),
            const SettingOption(icon: Icons.event_note, text: 'Acknowledgements', hasDialog: false, hasSwitch: false),
            const DividerTitle(title: 'SUPPORT'),
            const SettingOption(icon: Icons.help_outline, text: 'Help Center', hasDialog: false, hasSwitch: false),
            const SettingOption(icon: Icons.reddit, text: 'Visit r/redditmobile', hasDialog: false, hasSwitch: false),
            const SettingOption(icon: Icons.mail_outline, text: 'Report an issue', hasDialog: false, hasSwitch: false),
            const DividerTitle(title: 'BUILD INFORMATION'),
          ]
        ),
      )
    );
  }
}


class DividerTitle extends StatelessWidget {
  const DividerTitle({ Key? key, required this.title }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: seperateColor,
      padding: const EdgeInsets.only(left: 12),
      height: 50,
      child: Text(title, style: const TextStyle(color: textColor2, fontSize: 12, fontWeight: FontWeight.bold),)
    );
  }
}