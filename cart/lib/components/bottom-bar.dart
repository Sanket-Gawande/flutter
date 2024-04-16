import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatelessWidget {
  Function(int) navigateTo;
  BottomBar({super.key, required this.navigateTo});

  List navs = [
    {"label": 'Shop', "path": 0},
    {"label": 'Cart', "path": 1},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      padding: const EdgeInsets.all(8),
      child: GNav(mainAxisAlignment: MainAxisAlignment.center, tabs: [
        GButton(
          icon: Icons.home,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          borderRadius: BorderRadius.circular(6),
          backgroundColor: Colors.white,
          iconActiveColor: Colors.red.shade600,
          iconColor: Colors.grey.shade700,
          onPressed: () => navigateTo(0),
        ),
        GButton(
          icon: Icons.shopping_bag_rounded,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          borderRadius: BorderRadius.circular(6),
          backgroundColor: Colors.white,
          iconActiveColor: Colors.red.shade600,
          iconColor: Colors.grey.shade700,
          onPressed: () => navigateTo(1),
        ),
      ]),
    );
  }
}

class _GButton extends StatelessWidget {
  IconData icon;
  void Function(int) navigateTo;
  _GButton({super.key, required this.icon, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return GButton(
      icon: icon,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      borderRadius: BorderRadius.circular(6),
      backgroundColor: Colors.white,
      iconActiveColor: Colors.red.shade600,
      iconColor: Colors.grey.shade700,
      onPressed: () => navigateTo(1),
    );
  }
}
