import 'package:flutter/material.dart';
import 'package:music_roster_admin/api/mock_data.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/models/user/user_model.dart';
import 'package:music_roster_admin/models/user/user_role.dart';
import 'package:music_roster_admin/widgets/custom_button.dart';
// import 'package:multiselect/multiselect.dart';
import 'package:music_roster_admin/widgets/custom_textfield.dart';

class EditMemberDialog extends StatefulWidget {
  const EditMemberDialog({super.key});

  @override
  State<EditMemberDialog> createState() => _EditMemberDialogState();
}

class _EditMemberDialogState extends State<EditMemberDialog> {
  // final UserModel _user = Get.arguments[RoutesArgumentKey.user];
  final UserModel _user = testUsers[0];
  final List<UserRole> _roleOptions = UserRole.values;
  late List<UserRole> _currentRoles;
  late TextEditingController _nameEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _phoneEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _phoneEditingController = TextEditingController();
    _nameEditingController.text = _user.name;
    _emailEditingController.text = _user.email ?? '';
    _phoneEditingController.text = _user.phoneNumber ?? '';
    _currentRoles = _user.roles;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(AppText.editing, style: AppTextStyle.cardGridSubtitle),
          const SizedBox(height: 12),
          Text(AppText.editMemberTitle, style: AppTextStyle.cardTitle),
          const SizedBox(height: 24),
        ],
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                    editingController: _nameEditingController,
                    title: AppText.name),
                Paddings.inlineSpacingBox,
                CustomTextField(
                    editingController: _emailEditingController,
                    title: AppText.email),
                Paddings.inlineSpacingBox,
                CustomTextField(
                    editingController: _phoneEditingController,
                    title: AppText.phone),
              ],
            ),
          ),
          const SizedBox(width: 24),
          SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _renderRolesDropdown(),
              ],
            ),
          ),
        ],
      ),
      actions: [
        CustomButton(
            onPressed: () {},
            type: CustomButtonType.primary,
            child: Text(AppText.save,
                style: AppTextStyle.getButtonTextStyle(AppColors.white))),
      ],
    );
  }

  _configureRoles(List<String> stringValues) {
    List<UserRole> roles = [];
    for (final value in stringValues) {
      final role = UserRole.getUserRoleFromString(value);
      if (role != null) {
        roles.add(role);
      }
    }
    setState(() {
      _currentRoles = roles;
    });
  }

  _renderRolesDropdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppText.editRoles, style: AppTextStyle.dropdownFieldName),
        const SizedBox(height: 12),
        // DropDownMultiSelect(
        //   options: _roleOptions.map((e) => e.name).toList(),
        //   selectedValues: _currentRoles.map((e) => e.name).toList(),
        //   onChanged: _configureRoles,
        //   whenEmpty: '-',
        // ),
        // GFMultiSelect(
        //   padding: EdgeInsets.zero,
        //   items: _roleOptions.map((e) => e.name).toList(),
        //   onSelect: _configureRoles,
        //   dropdownTitleTileText: _currentRoles.map((e) => e.name).join(', '),
        //   listItemTextColor: AppColors.label,
        //   dropdownUnderlineBorder:
        //       const BorderSide(color: Colors.transparent, width: 2),
        //   dropdownTitleTileBorder: Border.all(color: Colors.grey, width: 1),
        //   dropdownTitleTileBorderRadius: BorderRadius.circular(4),
        //   expandedIcon:
        //       Icon(Icons.keyboard_arrow_down, color: AppColors.dropdownArrow),
        //   collapsedIcon:
        //       Icon(Icons.keyboard_arrow_up, color: AppColors.dropdownArrow),
        //   dropdownTitleTileTextStyle:
        //       const TextStyle(fontSize: 14, color: Colors.black54),
        //   margin: EdgeInsets.zero,
        //   type: GFCheckboxType.basic,
        //   activeBgColor: Colors.blue.withOpacity(0.5),
        //   inactiveBorderColor: Colors.grey,
        // ),
      ],
    );
  }
}
