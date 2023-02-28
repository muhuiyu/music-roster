import 'package:flutter/material.dart';
import 'package:music_roster_admin/models/common/screen_name.dart';
import 'package:music_roster_admin/modules/common/widgets/app_page.dart';
import 'package:music_roster_admin/modules/common/widgets/page_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      backgroundColor: Colors.red,
      currentScreen: ScreenName.dashboard,
      widgets: [
        _renderHeader(),
        _renderUpcomingServices(),
      ],
    );
  }

  Widget _renderHeader() {
    // TODO:
    return Container();
  }

  Widget _renderUpcomingServices() {
    // TODO:
    return Column(
      children: [
        PageCard(
          title: 'teest',
          child: Text('test'),
        ),
      ],
    );
  }

  Widget _renderNotification() {
    // TODO:
    return Container();
  }
}
