import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_519h0277/views/main_screens/chat_screen.dart';
import 'package:midterm_519h0277/views/main_screens/explore_screen.dart';
import 'package:midterm_519h0277/views/main_screens/home_screen.dart';
import 'package:midterm_519h0277/views/main_screens/notification_screen.dart';
import 'package:midterm_519h0277/views/main_screens/upload_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({ Key? key }) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  int _tab = 0;
  late PageController pageController;

  Color tabColor(int tab){
    if (_tab == tab){
      return Colors.black;
    }
    return Colors.grey;
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void tabNavigate(int tab){
    pageController.jumpToPage(tab);
  }

  void onPageChanged(int tab){    //dùng để đổi màu khi bấm vào icon dưới thanh nav
    setState(() {
      _tab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    // model.User? user = Provider.of<UserProvider>(context).getUser;       
    // user này có thể null vì lúc đầu có thể chưa kết nối tới firebase kịp để get
    return Scaffold(
      body: PageView(
        children: const [
          HomeScreen(),
          ExploreScreen(),
          Center(child: Text('Upload screen')),
          ChatScreen(),
          NotificationScreen(),
        ]
        ,  //liệt kê các page sẽ có (số lượng tương ứng với số icon dưới thanh nav)
        physics: const NeverScrollableScrollPhysics(), //tắt chuyển tab bằng cách kéo ngang
        controller: pageController,     
        onPageChanged: onPageChanged,   //thay đổi state của _tab bằng index của tab trong list children ở trên
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: CupertinoTabBar(
          onTap: tabNavigate,       //dùng để chuyển trang
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: tabColor(0),     //xét xem _tab hiện tại có bằng argument truyền vào tabColor có bằng nhau kh để nổi bật màu lên
                ),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  color: tabColor(1),
                ),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UploadScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 24),
                    child: Icon(
                      Icons.add,
                      size: 50,
                      color: tabColor(2),
                    ),
                  ),
                ),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble,
                  color: tabColor(3),
                ),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: tabColor(4),
                ),
                label: '',
                backgroundColor: Colors.white),

          ],
        ),
      ),
    );
  }
}