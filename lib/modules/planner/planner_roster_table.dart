import 'package:flutter/material.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/models/common/year_month_day.dart';
import 'package:music_roster_admin/models/service/service_model.dart';
import 'package:music_roster_admin/models/user/user_model.dart';
import 'package:music_roster_admin/models/user/user_role.dart';
import 'package:music_roster_admin/modules/planner/planner_role_block.dart';

class PlannerRosterTable extends StatelessWidget {
  final List<ServiceModel> services;
  final Function(YearMonthDay date, UserRole role) onRoleBlockTap;
  final Map<String, UserModel> userMap;

  const PlannerRosterTable({
    super.key,
    required this.services,
    required this.onRoleBlockTap,
    required this.userMap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10,
          dataRowMinHeight: 200,
          dataRowMaxHeight: 200,
          columns: services
              .map((service) => DataColumn(
                  label: Center(
                      child: Text(service.date.dateString(),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.tableHeader))))
              .toList(),
          rows: [
            DataRow(
                cells: services
                    .map((service) => _renderRoleBlock(service, UserRole.lead))
                    .toList()),
            DataRow(
                cells: services
                    .map((service) => _renderRoleBlock(service, UserRole.vocal))
                    .toList()),
            DataRow(
                cells: services
                    .map((service) => _renderRoleBlock(service, UserRole.piano))
                    .toList()),
            DataRow(
                cells: services
                    .map((service) => _renderRoleBlock(service, UserRole.drums))
                    .toList()),
            DataRow(
                cells: services
                    .map(
                        (service) => _renderRoleBlock(service, UserRole.guitar))
                    .toList()),
            DataRow(
                cells: services
                    .map((service) => _renderRoleBlock(service, UserRole.bass))
                    .toList()),
            DataRow(
                cells: services
                    .map((service) => _renderRoleBlock(service, UserRole.cajon))
                    .toList()),
          ],
        ),
      ),
    );
  }

  DataCell _renderRoleBlock(ServiceModel serviceModel, UserRole role) {
    final users = serviceModel.members.entries
        .where((e) => e.value.contains(role))
        .map((e) => userMap[e.key])
        .fold(List<UserModel>.empty(growable: true), (previousValue, element) {
      if (element != null) {
        previousValue.add(element);
      }
      return previousValue;
    });

    return DataCell(
        PlannerRoleBlock(
          role: role,
          selectedUsers: users,
          userMap: userMap,
        ), onTap: () {
      onRoleBlockTap(serviceModel.date, role);
    });
  }
}
