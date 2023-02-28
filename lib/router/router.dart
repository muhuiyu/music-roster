import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_roster_admin/models/common/screen_name.dart';
import 'package:music_roster_admin/models/event/event.dart';
import 'package:music_roster_admin/modules/account/account_screen.dart';
import 'package:music_roster_admin/modules/auth/screens/login_screen.dart';
import 'package:music_roster_admin/modules/dashboard/dashboard_screen.dart';
import 'package:music_roster_admin/modules/notifications/notifications_screen.dart';

class Routes {
  Routes._();

  static String loginScreen = ScreenName.login.route;
  static String dashboardScreen = ScreenName.dashboard.route;
  static String accountScreen = ScreenName.account.route;
  static String notificationsScreen = ScreenName.notifications.route;

  // Routes
  static final routes = <String, WidgetBuilder>{
    loginScreen: (BuildContext context) => const LoginScreen(),
    dashboardScreen: (BuildContext context) => const DashboardScreen(),
    accountScreen: (BuildContext context) => const AccountScreen(),
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
