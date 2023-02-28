import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_roster_admin/constants/app_colors.dart';
import 'package:music_roster_admin/models/common/screen_name.dart';

/// HEAD
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<ScreenName> _screens = [
    ScreenName.dashboard,
    ScreenName.team,
    ScreenName.account,
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Get.toNamed('/${_screens[index].id}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.primary,
      onTap: _onItemTapped,
      items: _screens
          .map((e) => BottomNavigationBarItem(
                icon: Icon(e.getIconData(false)),
                activeIcon: Icon(e.getIconData(true)),
                label: e.name,
              ))
          .toList(),
      type: BottomNavigationBarType.fixed,
    );
  }
}
