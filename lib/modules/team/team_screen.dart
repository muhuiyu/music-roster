import 'package:flutter/material.dart';
import 'package:music_roster_admin/models/common/screen_name.dart';
import 'package:music_roster_admin/modules/common/widgets/custom_page.dart';
import 'package:music_roster_admin/widgets/custom_dropdown.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      currentScreen: ScreenName.team,
      widgets: [
        // TODO:
        CustomDropDown(
          items: ['items', 'item'],
          title: 'title',
          onChanged: (item) {
            // TODO:
          },
        ),
        _renderRosterTable(),
      ],
    );
  }

  Widget _renderRosterTable() {
    // TODO:
    return Container();
  }
}
