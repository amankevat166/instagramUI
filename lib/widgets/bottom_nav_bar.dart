
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/heart.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/post.dart';
import 'package:instagram/screens/profile/profile.dart';
import 'package:instagram/screens/search.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    Search(),
    Post(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label: "Post"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "Profile"),
        ],),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
