import 'package:flutter/material.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/models/user/user_model.dart';

class PlannerUserList extends StatelessWidget {
  final List<UserModel> users;
  const PlannerUserList({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Musicans',
          style: AppTextStyle.cardTitle,
        ),
        Paddings.cardGridInlineSpacingBox,
        Container(
          width: WidgetSize.plannerUserListWidth,
          decoration: BoxDecoration(
              color: AppColors.lightBackgroundGray,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: users.map((e) => PlannerUserListTile(user: e)).toList(),
          ),
        ),
      ],
    );
  }
}

class PlannerUserListTile extends StatelessWidget {
  final UserModel user;
  const PlannerUserListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.roles.map((e) => e.name).join(', ')),
      trailing: Text(
        '3/20 weeks',
        style: AppTextStyle.getTextStyle(AppFont.body, Colors.blue),
      ),
    );
  }
}
