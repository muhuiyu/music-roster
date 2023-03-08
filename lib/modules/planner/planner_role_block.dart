import 'package:flutter/material.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/models/common/year_month_day.dart';
import 'package:music_roster_admin/models/user/user_model.dart';
import 'package:music_roster_admin/models/user/user_role.dart';
import 'package:music_roster_admin/modules/planner/planner_multi_select.dart';
import 'package:music_roster_admin/widgets/custom_button.dart';

class PlannerRoleBlock extends StatefulWidget {
  final YearMonthDay date;
  final UserRole role;
  final Map<String, UserModel> userMap;
  List<UserModel> selectedUsers;

  PlannerRoleBlock({
    super.key,
    required this.date,
    required this.role,
    required this.userMap,
    required this.selectedUsers,
  });

  @override
  State<PlannerRoleBlock> createState() => _PlannerRoleBlockState();
}

class _PlannerRoleBlockState extends State<PlannerRoleBlock> {
  late List<UserModel> _selectedUsers = [];

  @override
  void initState() {
    super.initState();
    _selectedUsers = widget.selectedUsers;
  }

  bool get _isEmpty {
    return widget.selectedUsers.isEmpty;
  }

  _showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(
            title: 'Select ${widget.role.name} on ${widget.date.dateString()}',
            selectedItem: _selectedUsers.map((e) => e.name).toList(),
            items: widget.userMap.values
                .where((user) => user.roles.contains(widget.role))
                .map<String>((e) => e.name)
                .toList());
      },
    );

    if (results != null) {
      setState(() {
        _selectedUsers = results.map<UserModel>((name) {
          return widget.userMap.values
              .firstWhere((element) => element.name == name);
        }).fold(List<UserModel>.empty(growable: true),
            (previousValue, element) {
          if (element != null) {
            previousValue.add(element);
          }
          return previousValue;
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Text(
        widget.role.name,
        style: AppTextStyle.getTextStyle(
            AppFont.body, _isEmpty ? AppColors.grey : AppColors.white),
      ),
      Paddings.cardGridInlineSpacingBox,
    ];
    widgets
        .addAll(widget.selectedUsers.map((e) => _renderUserChip(e)).toList());
    widgets.addAll([
      Paddings.cardGridInlineSpacingBox,
      TextButton(
        onPressed: _showMultiSelect,
        child: const Text('Edit'),
      ),
    ]);

    return Container(
      height: WidgetSize.plannerBlockHeight,
      width: WidgetSize.plannerBlockWidth,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color:
              _isEmpty ? AppColors.inactiveGrayBackground : widget.role.color,
          borderRadius: BorderRadius.circular(8)),
      child: Center(child: Column(children: widgets)),
    );
  }

  Widget _renderUserChip(UserModel user) {
    return CustomTextButton(
      text: user.name,
      onPressed: () {
        // TODO:
      },
      type: CustomButtonType.primaryWhite,
    );
  }
}
