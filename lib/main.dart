import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_roster_admin/modules/dashboard/dashboard_screen.dart';
import 'package:music_roster_admin/modules/service_model/service_details_screen.dart';
import 'package:music_roster_admin/modules/team/team_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:music_roster_admin/api/providers/auth_provider.dart';
import 'package:music_roster_admin/api/providers/data_provider.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/router/router.dart';
import 'package:music_roster_admin/base/service_locator.dart';
import 'package:music_roster_admin/widgets/loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env');
  await setupLocator();

  return runZonedGuarded(() async {
    runApp(const TeamRoster());
  }, (error, stack) {
    if (kDebugMode) {
      print(stack);
      print(error);
    }
  });
}

class TeamRoster extends StatelessWidget {
  const TeamRoster({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return OverlaySupport.global(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppText.appName,
            routes: Routes.routes,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: LoaderView(
                  child: child!,
                ),
              );
            },
            home: MyWidget(),
            // home: const ServiceDetailsScreen(),
          ),
        );
      }),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('test'),
    );
  }
}
