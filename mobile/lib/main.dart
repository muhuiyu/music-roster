import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_roster/models/common/screen_name.dart';
import 'package:music_roster/modules/common/screens/main_screen.dart';
import 'package:music_roster/modules/dashboard/dashboard_screen.dart';
import 'package:music_roster/modules/service_model/service_details_screen.dart';
import 'package:music_roster/modules/team/team_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:music_roster/api/providers/auth_provider.dart';
import 'package:music_roster/api/providers/data_provider.dart';
import 'package:music_roster/constants/constants.dart';
import 'package:music_roster/router/router.dart';
import 'package:music_roster/base/service_locator.dart';
import 'package:music_roster/widgets/loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
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

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
            home: MainScreen(
              currentScreen: ScreenName.dashboard,
            ),
            // home: const ServiceDetailsScreen(),
          ),
        );
      }),
    );
  }
}
