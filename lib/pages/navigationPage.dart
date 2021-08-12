import 'package:dang/constants/const.dart';
import 'package:dang/pages/profile2Page.dart';
import 'package:flutter/material.dart';

import 'chatPage.dart';
import 'morePage.dart';

class NavigationBtn extends StatefulWidget {
  const NavigationBtn({Key? key}) : super(key: key);

  @override
  _NavigationBtnState createState() => _NavigationBtnState();
}

class _NavigationBtnState extends State<NavigationBtn> {
  int currentIndex = 0;
  final screens = [FifthBody(), Chat(), More()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 40,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: kBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: kBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
            backgroundColor: kBlue,
          ),
        ],
      ),
    );
  }
}
