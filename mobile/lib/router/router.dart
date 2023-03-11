import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_roster/models/common/screen_name.dart';
import 'package:music_roster/models/service/service_model.dart';
import 'package:music_roster/modules/account/account_screen.dart';
import 'package:music_roster/modules/auth/screens/login_screen.dart';
import 'package:music_roster/modules/common/screens/main_screen.dart';
import 'package:music_roster/modules/dashboard/dashboard_screen.dart';
import 'package:music_roster/modules/notifications/notifications_screen.dart';

class Routes {
  Routes._();

  static String loginScreen = ScreenName.login.route;
  static String dashboardScreen = ScreenName.dashboard.route;
  static String teamScreen = ScreenName.team.route;
  static String accountScreen = ScreenName.account.route;
  static String calendarScreen = ScreenName.calendar.route;
  static String notificationsScreen = ScreenName.notifications.route;

  // Routes
  static final routes = <String, WidgetBuilder>{
    loginScreen: (BuildContext context) => const LoginScreen(),
    dashboardScreen: (BuildContext context) =>
        const MainScreen(currentScreen: ScreenName.dashboard),
    teamScreen: (BuildContext context) =>
        const MainScreen(currentScreen: ScreenName.team),
    accountScreen: (BuildContext context) =>
        const MainScreen(currentScreen: ScreenName.account),
    calendarScreen: (BuildContext context) =>
        const MainScreen(currentScreen: ScreenName.calendar),
    notificationsScreen: (BuildContext context) => const NotificationsScreen(),
  };

  static Map<String, dynamic> accountArgument(User user) {
    return {RoutesArgumentKey.user: user};
  }

  static Map<String, dynamic> serviceDetailsArgument(
      ServiceModel serviceModel) {
    return {RoutesArgumentKey.serviceModel: serviceModel};
  }
}

class RoutesArgumentKey {
  static const String user = 'user';
  static const String yearQuarter = 'yearQuarter';
  static const String serviceModel = 'serviceModel';
}
