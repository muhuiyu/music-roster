import 'package:flutter/material.dart';
import 'package:music_roster/constants/constants.dart';
import 'package:music_roster/models/common/screen_name.dart';

enum BaseScreenType { root, modal, sub }

class BaseScreen extends StatelessWidget {
  final ScreenName currentScreen;
  final List<Widget> widgets;
  final Function()? onSaveButtonPressed;

  const BaseScreen({
    super.key,
    required this.currentScreen,
    required this.widgets,
    this.onSaveButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: Paddings.pageHeader,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    ));
  }
}
