import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mazdoor/Screens/profilescreen.dart';

import 'home.dart';
import 'homeNavscreen.dart';
import 'messagescreen.dart';
import 'myjobscreen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _bottomNavIndex = 0;

  final List<IconData> iconList = [
    Icons.home,
    Icons.work,
    Icons.message,
    Icons.person,
  ];
List bdy=[
  HomeScreen(),
  MyJobsScreen(),
  MessagesScreen(),
  ProfileScreen()
];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: bdy[_bottomNavIndex],
      floatingActionButton: Container(
          width: 46,
          height: 46,
          child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.deepOrange,
            ),
            child: Icon(Icons.add,size: 26,),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,iconSize: 29,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey.shade600,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}