import 'package:flutter/material.dart';
import 'package:music_roster_admin/api/mock_data.dart';
import 'package:music_roster_admin/api/providers/data_provider.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/helpers/app_message.dart';
import 'package:music_roster_admin/models/common/screen_name.dart';
import 'package:music_roster_admin/models/common/year_month_day.dart';
import 'package:music_roster_admin/models/service/service_model.dart';
import 'package:music_roster_admin/modules/common/widgets/custom_page.dart';
import 'package:music_roster_admin/modules/common/widgets/page_card.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<ServiceModel> _upcomingServices;
  late DataProvider _dataProvider;

  @override
  void initState() {
    _upcomingServices = [];
    _dataProvider = Provider.of<DataProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      _fetchData();
    });
    super.initState();
  }

  _fetchData() async {
    _dataProvider.fetchUpcomingServices(numberOfServices: 2).then((value) {
      setState(() {
        _upcomingServices = value;
      });
    }).onError(
        (error, stackTrace) => AppMessage.errorMessage(error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
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
    List<Widget> widgets = [
      Text(
        'Upcoming services',
        style: AppTextStyle.getTextStyle(AppFont.h2, AppColors.label,
            weight: TextStyleWeight.bold),
      ),
      Paddings.inlineSpacingBox,
    ];
    widgets.add(Row(
        children: _upcomingServices
            .map((e) => _renderUpcomingServiceCard(e))
            .toList()));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _renderUpcomingServiceCard(ServiceModel serviceModel) {
    return Card(
      margin: EdgeInsets.only(right: 24),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceModel.date.dateString(),
                style: AppTextStyle.cardTitle,
              ),
              Paddings.inlineSpacingBox,
              Text(
                'Members: ${serviceModel.members.keys.join(', ')}',
                style: AppTextStyle.cardGridSubtitle,
              ),
              Paddings.cardGridInlineSpacingBox,
              Text(
                'Songs: ${serviceModel.songs.map((e) => e.songName).join(', ')}',
                style: AppTextStyle.cardGridSubtitle,
              ),
              Paddings.inlineSpacingBox,
              ElevatedButton(
                  onPressed: () {
                    // TODO:
                  },
                  child: Text('View details'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderNotification() {
    // TODO:
    return Container();
  }
}
