import 'package:flutter/material.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/modules/account/account_screen.dart';
import 'package:music_roster_admin/modules/auth/screens/login_screen.dart';
import 'package:music_roster_admin/modules/common/widgets/app_page.dart';
import 'package:music_roster_admin/modules/dashboard/dashboard_screen.dart';
import 'package:music_roster_admin/modules/service_model/service_details_screen.dart';
import 'package:music_roster_admin/modules/notifications/notifications_screen.dart';
import 'package:music_roster_admin/modules/team/team_screen.dart';

enum ScreenName {
  login,
  dashboard,
  serviceDetails,
  notifications,
  team,
  account;

  static ScreenName? fromString(String rawString) {
    for (var value in ScreenName.values) {
      if (value.id == rawString) return value;
    }
    return null;
  }

  static List<ScreenName> toRoute(String rawRouteString) {
    List<ScreenName> routes = [];
    rawRouteString.split('/').forEach((element) {
      var page = ScreenName.fromString(element);
      if (page != null) {
        routes.add(page);
      }
    });
    return routes;
  }
}

extension AppPageTypeExtension on ScreenName {
  String get route {
    return '/$id';
  }

  bool get isRoot {
    var pagesAreRoot = [
      ScreenName.dashboard,
      ScreenName.team,
      ScreenName.account,
    ];
    return pagesAreRoot.contains(this);
  }

  CustomPageAction? get action {
    switch (this) {
      case ScreenName.login:
        return null;
      case ScreenName.dashboard:
        return CustomPageAction.notification;
      case ScreenName.serviceDetails:
        return null;
      case ScreenName.notifications:
        return null;
      case ScreenName.team:
        return CustomPageAction.notification;
      case ScreenName.account:
        return CustomPageAction.notification;
    }
  }

  Widget get widget {
    switch (this) {
      case ScreenName.login:
        return LoginScreen();
      case ScreenName.dashboard:
        return DashboardScreen();
      case ScreenName.serviceDetails:
        return ServiceDetailsScreen();
      case ScreenName.notifications:
        return NotificationsScreen();
      case ScreenName.team:
        return TeamScreen();
      case ScreenName.account:
        return AccountScreen();
    }
  }

  CustomPageType get pageType {
    switch (this) {
      case ScreenName.login:
        return CustomPageType.root;
      case ScreenName.dashboard:
        return CustomPageType.root;
      case ScreenName.serviceDetails:
        return CustomPageType.sub;
      case ScreenName.notifications:
        return CustomPageType.modal;
      case ScreenName.team:
        return CustomPageType.root;
      case ScreenName.account:
        return CustomPageType.root;
    }
  }

  Color get appBarBackgroundColor {
    switch (this) {
      case ScreenName.login:
        return AppColors.white;
      case ScreenName.dashboard:
        return AppColors.primary;
      case ScreenName.serviceDetails:
        return AppColors.white;
      case ScreenName.notifications:
        return AppColors.white;
      case ScreenName.team:
        return AppColors.primary;
      case ScreenName.account:
        return AppColors.primary;
    }
  }

  String getIconName(bool isActive) {
    // switch (this) {
    //   case ScreenName.weeklyKpi:
    //     return isActive ? AppImage.weeklyKpiBlack : AppImage.weeklyKpiWhite;
    //   case ScreenName.report:
    //     return isActive ? AppImage.reportBlack : AppImage.reportWhite;
    //   case ScreenName.settings:
    //     return isActive ? AppImage.settingsBlack : AppImage.settingsWhite;
    //   default:
    //     return '';
    // }
    return '';
  }

  IconData? getIconData(bool isActive) {
    switch (this) {
      case ScreenName.login:
        return null;
      case ScreenName.dashboard:
        return Icons.dashboard;
      case ScreenName.serviceDetails:
        return null;
      case ScreenName.notifications:
        return Icons.notifications;
      case ScreenName.team:
        return Icons.people;
      case ScreenName.account:
        return Icons.person;
    }
  }

  String get id {
    return toString().split('.').last;
  }

  String get name {
    switch (this) {
      case ScreenName.login:
        return AppText.login;
      case ScreenName.dashboard:
        return AppText.dashboardTitle;
      case ScreenName.serviceDetails:
        return AppText.eventDetailsTitle;
      case ScreenName.notifications:
        return AppText.notificationTitle;
      case ScreenName.team:
        return AppText.teamTitle;
      case ScreenName.account:
        return AppText.accountTitle;
    }
  }
}

enum CustomPageAction { save, notification }

// class AppScreen {
//   static final kpiPage = KpiPageRoute(); // TODO: change to const
//   static EditEmployeePageRoute editEmployeePage({required Employee employee}) {
//     return EditEmployeePageRoute(employee: employee);
//   }
// }

// class EditEmployeePageRoute extends AppRoute {
//   Employee employee;
//   EditEmployeePageRoute({required this.employee})
//       : super(name: AppPageName.editEmployee);
// }

// class KpiPageRoute extends AppRoute {
//   KpiPageRoute() : super(name: AppPageName.weeklyKpi);
// }

// abstract class AppRoute {
//   final AppPageName name;
//   AppRoute({required this.name});
// }
