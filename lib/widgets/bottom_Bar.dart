import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/settings.dart';
import 'package:ecommerce/view/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
   BottomBar({super.key});

  List screens=[
    const HomeScreen(),
    const Wishlist(),
    const SettingScreen()
  ];
 

 
  @override
  State<BottomBar> createState() => _BottomBarState();
  
}

class _BottomBarState extends State<BottomBar> {
   void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
   int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        tabs: [

        ],
      ),
    );
    
  }
 
}