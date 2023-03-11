import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_roster/constants/app_colors.dart';
import 'package:music_roster/models/common/screen_name.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<ScreenName> _screens = [
    ScreenName.dashboard,
    ScreenName.calendar,
    ScreenName.team,
    ScreenName.account,
  ];

  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      Get.offAndToNamed(_screens[index].route);
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
