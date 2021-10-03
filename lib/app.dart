import 'package:acrop/helper/sharepref.dart';
import 'package:acrop/view/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/books/books.dart';
import 'view/entertainment/entertainment.dart';
import 'view/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  PageController? _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Books(),
    Entertainment(),
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Acropolis"),
          
            FlatButton(
                onPressed: () {
                  showDialogWithFields(context);
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Apps")),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), title: Text("Books")),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), title: Text("Entertainment")),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController!.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void showDialogWithFields(BuildContext context) {
   

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Are you sure to logout'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('NO'),
            ),
            TextButton(
              onPressed: () {
                ///  _auth.signOut();
                AppSharedPref.removeUser();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('YES'),
            ),
          ],
        );
      },
    );
  }
}
